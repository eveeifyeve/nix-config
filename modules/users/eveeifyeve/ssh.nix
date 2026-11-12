{
  home.base = hmArgs: {
    programs.git.settings.url."eveeifyeve.dev@tangled.org".insteadOf = "https://tangled.org";

    programs.ssh = {
      includes = [ "${hmArgs.config.home.homeDirectory}/.ssh/hosts/*" ];
      settings."Host *" = {
        setEnv = "TERM=xterm-256color";
        compression = true;
        identitiesOnly = true;
        hashKnownHosts = false;
        identityFile = "${hmArgs.config.home.homeDirectory}/.ssh/id_ed25519";
      };
    };
  };

  # nixos.modules.base = {
  #   users.users.eveeifyeve.openssh.authorizedKeys.keys = [
  #   ];
  # };
}
