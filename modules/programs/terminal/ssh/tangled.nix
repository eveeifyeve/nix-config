{
  nixos.modules.base = {
    # https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/githubs-ssh-key-fingerprints
    programs.ssh.knownHosts."github.com".publicKey = "";
  };
}
