{
  nixvim.modules.base = {
    plugins = {
      cmp-nvim-lsp.enable = true;
      cmp.settings.sources = [ { name = "nvim-lsp"; } ];
    };
  };
}
