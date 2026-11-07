{ inputs, lib, ... }: {
  flake-file.inputs.hermes-agent.url = "github:NousResearch/hermes-agent";

  homeManager.modules.gui =
    { pkgs, ... }: {
      imports = [ inputs.hermes-agent.homeManagerModules.default ];
      programs.hermes-agent.desktop.enable =
        lib.mkIf pkgs.stdenv.hostPlatform.isLinux true;
    };
}
