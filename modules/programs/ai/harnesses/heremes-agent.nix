{ inputs, ... }: {
  flake-file.inputs.hermes-agent.url = "github:NousResearch/hermes-agent";

  homeManager.modules.gui = {
    imports = [ inputs.hermes-agent.homeManagerModules.default ];
    programs.hermes-agent.desktop.enable = true;
  };
}
