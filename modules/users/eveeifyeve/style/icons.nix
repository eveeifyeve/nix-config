{ lib, ... }:
{
  home.gui =
    { pkgs, ... }:
    {
      stylix.icons = lib.mkIf pkgs.stdenv.hostPlatform.isLinux {
        enable = true;
        # `catppuccin-icon-theme` is gone upstream (catppuccin/icon-theme removed)
        # and never existed in nixpkgs; the closest surviving package is the
        # Papirus fork with catppuccin folder colors (mocha flavor baked in).
        dark = "Papirus-Dark";
        light = "Papirus-Light";
        package = pkgs.catppuccin-papirus-folders;
      };
    };
}
