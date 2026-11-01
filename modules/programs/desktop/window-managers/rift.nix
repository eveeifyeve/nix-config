{ lib, inputs, ... }:
{
  flake-file.inputs.nixpkgs-rift.url = "github:NixOS/nixpkgs?ref=refs/pull/576297/head";

  homeManager.modules.gui =
    { pkgs, ... }:
    {
      programs.rift-wm = lib.mkIf pkgs.stdenv.hostPlatform.isDarwin {
        enable = true;
        package = inputs.nixpkgs-rift.legacyPackages.${pkgs.stdenv.hostPlatform.system}.rift-wm;
        launchd.enable = true;
        config.settings.default_disable = false; # Enable by default.
      };
    };
}
