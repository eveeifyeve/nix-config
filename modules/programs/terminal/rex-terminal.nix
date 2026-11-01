{ lib, ... }: {
  nixpkgs.config.allowUnfreePackages = [
    "rex"
    "rex.dmg"
  ];

  homeManager.modules.gui =
    { pkgs, ... }:
    lib.mkIf pkgs.stdenv.isDarwin {
      home.packages = [ (pkgs.callPackage ../_packages/rex-terminal.nix { }) ];
    };
}
