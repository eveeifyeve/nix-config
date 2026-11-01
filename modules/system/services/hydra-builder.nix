{ inputs, lib, ... }:
{
  #flake-file.inputs.hydra-modular-service.url = "github:DigitalBrewStudios/hydra/modular-service";

  darwin.modules.builder =
    { pkgs, ... }:
    {
      imports = [ ];
    };
}
