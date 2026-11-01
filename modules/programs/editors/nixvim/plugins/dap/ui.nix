{
  nixvim.modules.base = {
    plugins.dap-ui = {
      enable = true;
      lazyLoad = {
        enable = true;
        settings.keys = [
          {
            __unkeyed-1 = "<leader>du";
            __unkeyed-2.__raw = ''
              function()
                require('dap.ext.vscode').load_launchjs(nil, {
                  ["java"] = {"java"}
                })

                require("dapui").toggle()
              end
            '';
            desc = "Toggle Debugger UI";
          }
        ];
      };
    };
  };
}
