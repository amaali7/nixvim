{ helpers, ... }: {
  plugins = {
    luasnip.enable = true;

    cmp = {
      enable = true;

      cmdline =
        let
          search = {
            mapping = helpers.mkRaw # lua
              "cmp.mapping.preset.cmdline()";
            sources = [{ name = "buffer"; }];
          };
        in
        {
          "/" = search;
          "?" = search;
          ":" = {
            mapping = helpers.mkRaw # lua
              "cmp.mapping.preset.cmdline()";
            sources = [{ name = "cmdline"; }];
          };
        };

      settings = {
        experimental = { ghost_text = true; };

				formatting = {fields = ["kind" "abbr" "menu"];
					#	format = ''

					#		'';};

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
            name = "luasnip";
            groupIndex = 1;
            priority = 5;
          }
          {
            name = "nvim_lsp";
            groupIndex = 1;
            priority = 3;
          }
          { name = "omni"; }
          { name = "path"; }
          # { name = "cmdline"; }
          { name = "buffer"; }
          { name = "dictionary"; }
        ];
      };
    };

    cmp-cmdline.enable = true;
    cmp-dictionary.enable = true;
    cmp-fuzzy-path.enable = true;
    cmp-fuzzy-buffer.enable = true;
    cmp-nvim-lsp.enable = true;
    cmp_luasnip.enable = true;
    friendly-snippets.enable = true;
  };
}
