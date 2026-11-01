{
  nixvim.modules.base = {
    plugins.telescope = {
      luaConfig.pre = ''
        require("telescope").load_extension "pomodori"	
      '';

      keymaps."<leader>pt" = {
        action = "function() require('telescope').extensions.pomodori.timers()";
        options = {
          desc = "Manage Pomodori Timers";
        };
      };
    };
  };
}
