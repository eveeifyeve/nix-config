{ lib, ... }: {
  nixpkgs.config.allowUnfreePackages = [
    "rex-terminal"
    "rex.dmg"
  ];

  homeManager.modules.gui =
    { pkgs, ... }:
    lib.mkIf pkgs.stdenv.hostPlatform.isDarwin {
      home.packages = [ (pkgs.callPackage ../../_packages/rex-terminal.nix { }) ];
    };
}
