{
  nixvim.modules.base = {
    plugins.dap-ui.lazyLoad.settings.before.__raw = ''
      function()
        require('lz.n').trigger_load('nvim-dap')
      end
    '';
  };
}
