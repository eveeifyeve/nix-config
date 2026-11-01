{
  darwin.modules.base =
    { pkgs, ... }:
    {
      nix.linux-builder = {
        enable = true;
        package = pkgs.darwin.linux-builder-x86_64;
        ephemeral = true;
      };
    };
}
