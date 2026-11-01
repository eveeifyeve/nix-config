{
  nixvim.modules.base = {
    plugins = {
      cmp-path.enable = true;
      cmp.settings.sources = [ { name = "cmp-path"; } ];
    };
  };
}
