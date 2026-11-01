{
  nixvim.modules.base =
    { lib, pkgs, ... }:
    {
      plugins = {
        dap-lldb.enable = true;
        dap.adapters.executables = {
          lldb.command = "${lib.getExe' pkgs.lldb "lldb-vscode"}";
        };
      };
    };
}
