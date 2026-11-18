{ lib, inputs, ... }:
{
  flake-file.inputs.hyprland-scroll-overview = {
    url = "github:yayuuu/hyprland-scroll-overview";
    # flake-edit misfollows `flake-parts` to `nixpkgs`, which breaks
    # `flake-parts.lib.mkFlake` when the plugin package is evaluated.
    inputs.flake-parts.follows = "flake-parts";
  };

  homeManager.modules.gui =
    { pkgs, ... }:
    lib.mkIf pkgs.stdenv.hostPlatform.isLinux {
      wayland.windowManager.hyprland.plugins = [
        inputs.hyprland-scroll-overview.packages.${pkgs.stdenv.hostPlatform.system}.scrolloverview
      ];
    };
}
