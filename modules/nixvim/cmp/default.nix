{ helpers, ... }: {
  plugins = {
    luasnip.enable = true;
    cmp-dap.enable = true;
    cmp = {
      enable = true;
      settings = {
        experimental = { ghost_text = true; };

        formatting = {
          fields = [ "kind" "abbr" "menu" ];
          #	format = ''

          #		'';
        };

        mapping = {
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-b>" = "cmp.mapping.scroll_docs(-4)";
          "<C-e>" = "cmp.mapping.abort()";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
          "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";

        };

        snippet = {
          expand =
            ''function(args) require("luasnip").lsp_expand(args.body) end'';
        };

        sources = [

          {
            name = "nvim_lsp";
            keyword_length = 2;
            groupIndex = 1;
            priority = 1;
          }
          {
            name = "luasnip";
            keyword_length = 2;
            groupIndex = 1;
            priority = 3;
          }
          {
            name = "path";
            keyword_length = 2;
            priority = 4;
          }
          {
            name = "cmdline";
            keyword_length = 2;
            priority = 5;
          }
          {
            name = "buffer";
            keyword_length = 2;
            priority = 2;
          }
        ];
      };
    };

    cmp-cmdline.enable = true;
    cmp-fuzzy-path.enable = true;
    cmp-fuzzy-buffer.enable = true;
    cmp-nvim-lsp.enable = true;
    cmp_luasnip.enable = true;
    friendly-snippets.enable = true;
  };
}
