{ lib, config, ... }:
{
  options.ssh.knownHosts = lib.mkOption {
    type = lib.types.attrsOf (
      lib.types.submodule (
        { name, config, ... }: {
          options = {
            certAuthority = lib.mkOption {
              type = lib.types.bool;
              default = false;
              description = ''
                This public key is an SSH certificate authority, rather than an
                individual host's key.
              '';
            };
            hostNames = lib.mkOption {
              type = lib.types.listOf lib.types.str;
              default = [ name ] ++ config.extraHostNames;
              description = ''
                The set of system-wide known SSH hosts. To make simple setups more
                convenient the name of an attribute in this set is used as a host name
                for the entry. This behaviour can be disabled by setting
                `hostNames` explicitly. You can use
                `extraHostNames` to add additional host names without
                disabling this default.
              '';
            };
            extraHostNames = lib.mkOption {
              type = lib.types.listOf lib.types.str;
              default = [ ];
              description = ''
                A list of additional host names and/or IP numbers used for
                accessing the host's ssh service. This list is ignored if
                `hostNames` is set explicitly.
              '';
            };
            publicKey = lib.mkOption {
              default = null;
              type = lib.types.nullOr lib.types.str;
              example = "ecdsa-sha2-nistp521 AAAAE2VjZHN...UEPg==";
              description = ''
                The public key data for the host. You can fetch a public key
                from a running SSH server with the {command}`ssh-keyscan`
                command. The public key should not include any host names, only
                the key type and the key itself.
              '';
            };
            publicKeyFile = lib.mkOption {
              default = null;
              type = lib.types.nullOr lib.types.path;
              description = ''
                The path to the public key file for the host. The public
                key file is read at build time and saved in the Nix store.
                You can fetch a public key file from a running SSH server
                with the {command}`ssh-keyscan` command. The content
                of the file should follow the same format as described for
                the `publicKey` option.
              '';
            };
          };
        }
      )
    );
    default = { };
    description = ''
      Definition of known SSH hosts.
    '';
  };

  config = {
    nixos.modules.base = {
      programs.ssh.knownHosts = config.ssh.knownHosts;
    };

    darwin.modules.base = {
      programs.ssh.knownHosts = config.ssh.knownHosts;
    };
  };
}
