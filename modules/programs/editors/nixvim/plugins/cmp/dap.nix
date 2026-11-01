{
  nixvim.modules.base = {
    plugins = {
      cmp-dap.enable = true;
      cmp.settings.sources = [ { name = "cmp-dap"; } ];
    };
  };
}
