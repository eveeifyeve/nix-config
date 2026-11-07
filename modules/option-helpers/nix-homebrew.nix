{
  lib,
  config,
  inputs,
  ...
}:
let
  cfg = config.nix-homebrew;

  officialDefaultTaps = {
    "homebrew/homebrew-core" = inputs.homebrew-core;
    "homebrew/homebrew-cask" = inputs.homebrew-cask;
  };
  allTaps = officialDefaultTaps // cfg.taps;
in
{
  options.nix-homebrew = {
    taps = lib.mkOption {
      type = lib.types.attrsOf lib.types.package;
      default = { };
      description = ''
        Additional Nix-managed Homebrew taps from pinned flake inputs,
        e.g. `"anomalyco/tap" = inputs.anomalyco-tap;`. Merges with
        the official taps managed here.
      '';
    };
  };

  config = {
    flake-file.inputs = {
      nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";

      homebrew-core = {
        url = "github:homebrew/homebrew-core";
        flake = false;
      };
      homebrew-cask = {
        url = "github:homebrew/homebrew-cask";
        flake = false;
      };
    };

    darwin.modules.base = {
      imports = [ inputs.nix-homebrew.darwinModules.nix-homebrew ];
      homebrew.enable = true;
      homebrew.onActivation.cleanup = "none";
      system.primaryUser = lib.mkDefault "eveeifyeve";

      homebrew.taps = builtins.attrNames allTaps;

      nix-homebrew = {
        enable = true;
        mutableTaps = true;
        user = "eveeifyeve";
        taps = allTaps;
        trust.taps = lib.filter (name: !lib.hasPrefix "homebrew/" name) (builtins.attrNames allTaps);
      };
    };
  };
}
