{ pkgs, helpers, ... }: {
  plugins.rustaceanvim = {
    enable = true;
    rustAnalyzerPackage = null;
    settings = {
      server = {
        # onAttach = helpers.mkRaw ''
        #      					function(client, bufnr)
        #        						local opts = { noremap=true, silent=true }
        #     						vim.api.nvim_buf_set_keymap(bufnr, 'n', 's', '<cmd>lua require("tree_climber_rust").init_selection()<CR>', opts)
        #     						vim.api.nvim_buf_set_keymap(bufnr, 'x', 's', '<cmd>lua require("tree_climber_rust").select_incremental()<CR>', opts)
        #     						vim.api.nvim_buf_set_keymap(bufnr, 'x', 'S', '<cmd>lua require("tree_climber_rust").select_previous()<CR>', opts)
        #   					end,
        #   				'';
        default_settings = {
          rust-analyzer = {
            diagnostics = {
              #              experimental = true;
            };
            procMacro = {
              ignored = {
                leptos_macro = [
                  "component"
                  "server"
                ];
              };
            };

            check = {
              command = "clippy";
            };
            inlayHints = {
              lifetimeElisionHints = {
                enable = "always";
              };
            };
          };
        };
        standalone = false;
      };
      dap = {
        excutable = {
          args = [ "--interpreter=dap" "--eval-command" "set print pretty on" ];
          command = "gdb";
        };
        name = "gdb";
      };
    };
  };
  plugins.crates-nvim.enable = true;
   extraPlugins = [
     (pkgs.vimUtils.buildVimPlugin {
       name = "ferris-nvim";
       src = pkgs.fetchFromGitHub {
         owner = "vxpm";
         repo = "ferris.nvim";
         rev = "b9cd307a4bb3de6d87fc5da26f0f2775f4e2873a";
         hash = "sha256-iKCM8XStyYV1BKdx0OO1e1m9an8Ytr48D80ZgxS01CU=";
       };
     })
  #   (pkgs.vimUtils.buildVimPlugin {
  #     name = "tree-climber-rust-nvim";
  #     src = pkgs.fetchFromGitHub {
  #       owner = "adaszko";
  #       repo = "tree_climber_rust.nvim";
  #       rev = "002358ab6f0b4696b75905804ea7f1dca34a7ccd";
  #       hash = "sha256-HDv8/52RZo/aAzcWxXfbYtPzzLRMwf+uhPRqz4I9Png=";
  #     };
  #   })
  ];

  # extraConfigLua = ''require('my-plugin').setup({foo = "bar"})'';
}
