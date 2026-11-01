{
  nixvim.modules.base = {
    plugins.telescope = {
      enable = true;
      keymaps = {
        "<leader><space>" = {
          action = "find_files";
          options = {
            desc = "Find project files";
          };
        };
        "<leader>fb" = {
          action = "file_browser";
          options = {
            desc = "Browse Project";
          };
        };
        "<leader>:" = {
          action = "command_history";
          options = {
            desc = "Command history";
          };
        };
        "<leader>ft" = {
          action = "live_grep";
          options = {
            desc = "Find text";
          };
        };
      };
    };
  };
}
