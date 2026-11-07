{ inputs, lib, ... }: {
  flake-file.inputs.hermes-agent.url = "github:NousResearch/hermes-agent";

  homeManager.modules.gui =
    { pkgs, ... }:
    lib.mkIf pkgs.stdnev.isLinux {
      imports = [ inputs.hermes-agent.homeManagerModules.default ];
      programs.hermes-agent.desktop.enable = true;
    };
}
