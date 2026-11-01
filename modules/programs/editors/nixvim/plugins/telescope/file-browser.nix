{
  nixvim.modules.base = {
    plugins.telescope = {
      extensions.file-browser = {
        enable = true;
        settings = {
          hijack_netrw = true;
          hidden = true;
          grouped = true;
          collapse_dirs = true;
          mappings.n = {
            "<C-h>" = "require('telescope._extensions.file_browser.actions').goto_parent_dir";
            "<C-j" = "require('telescope.actions').move_selection_worse";
            "<C-k>" = "require('telescope.actions').move_selection_better";
            "<C-l" = "require('telescope.actions').select_default";
          };
        };
      };

      keymaps."<leader>fb" = {
        action = "file_browser";
        options = {
          desc = "Browse Project";
        };
      };
    };
  };
}
