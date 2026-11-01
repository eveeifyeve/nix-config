{
  nixvim.modules.base =
    { lib, pkgs, ... }:
    {
      plugins.dap.adapters.executables.gdb.command = "${lib.getExe pkgs.gdb}";
    };
}
