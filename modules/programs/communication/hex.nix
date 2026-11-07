{ inputs, ... }: {
  flake-file.inputs.anomalyco-tap = {
    url = "github:anomalyco/homebrew-tap";
    flake = false;
  };

  nix-homebrew.taps = {
    "nomalyco/tap" = inputs.anomalyco-tap;
  };

  darwin.modules.base = {
    homebrew.casks = [ "hex" ];
  };
}
