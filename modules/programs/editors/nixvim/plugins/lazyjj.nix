{
  nixvim.modules.base =
    { pkgs, ... }:
    {
      extraPlugins = [ pkgs.vimPlugins.lazyjj-nvim ];
      extraConfigLua = "require('lazyjj').setup()";
      keymaps = [
        {
          action = "<cmd>LazyJJ<CR>";
          mode = "n";
          key = "<leader>j";
          options = {
            silent = true;
          };
        }
      ];
    };
}
