{
  nixvim.modules.base = {
    plugins.lazygit.enable = true;
    keymaps = [
      {
        action = "<cmd>LazyGit<CR>";
        mode = "n";
        key = "<leader>g";
        options = {
          silent = true;
        };
      }
    ];
  };
}
