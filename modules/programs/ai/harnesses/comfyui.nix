{ lib, ... }:
{
  homeManager.modules.gui =
    { pkgs, ... }:
    lib.mkIf pkgs.stdenv.hostPlatform.isLinux {
      home.packages = [ pkgs.comfyui ];
    };

  # nixos.modules.gui =
  #   { pkgs, ... }:
  #   {
  #     imports = [ inputs.nix-comfyui.nixosModules.default ];
  #     nix.settings = {
  #       substituters = [ "https://comfyui.cachix.org" ];
  #       trusted-public-keys = [ "comfyui.cachix.org-1:33mf9VzoIjzVbp0zwj+fT51HG0y31ZTK3nzYZAX0rec=" ];
  #     };
  #
  #     services.comfyui = {
  #       enable = true;
  #       gpuSupport = lib.mkIf pkgs.config.cudaSupport "cuda" ++ lib.mkIf pkgs.config.rocmSupport "amd";
  #     };
  #   };
}
