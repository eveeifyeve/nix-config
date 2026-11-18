{ inputs, lib, ... }:
let
  # Home Manager still applies `.override { hyprland = finalPackage; }` to the
  # portal, but xdg-desktop-portal-hyprland ≥ 1.5 is hyprtoolkit-based and no
  # longer links Hyprland, so the flake package rejects the argument. Accept
  # and ignore it to keep the vestigial override evaluating.
  hyprPortal =
    pkgs:
    lib.makeOverridable (
      {
        hyprland ? null,
        ...
      }:
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland
    ) { };
in
{
  flake-file.inputs.hyprland.url = "github:hyprwm/Hyprland";

  nixos.modules.gui =
    { pkgs, ... }:
    {
      programs.hyprland = {
        enable = true;
        package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
        portalPackage = hyprPortal pkgs;
        xwayland.enable = true;
        withUWSM = true;
      };
    };

  homeManager.modules.gui =
    { pkgs, ... }:
    lib.mkIf pkgs.stdenv.hostPlatform.isLinux {
      wayland.windowManager.hyprland = {
        enable = true;
        package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
        portalPackage = hyprPortal pkgs;
      };
    };
}
