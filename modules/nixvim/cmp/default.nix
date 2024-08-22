{ helpers, ... }: {
  plugins = {
    luasnip.enable = false;

    cmp = {
      enable = false;

      cmdline = let
        search = {
          mapping = helpers.mkRaw # lua
            "cmp.mapping.preset.cmdline()";
          sources = [{ name = "buffer"; }];
        };
      in {
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

        mapping = {
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-b>" = "cmp.mapping.scroll_docs(-4)";
          "<C-e>" = "cmp.mapping.abort()";
          "<CR>" = helpers.mkRaw # lua
            ''
							cmp.mapping({
								i = function(fallback)
									if cmp.visible() and cmp.get_active_entry() then
										cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
									else
										fallback()
									end
								end,
								s = cmp.mapping.confirm({ select = true }),
								c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
							})
						'';
				"<Tab>" = helpers.mkRaw # lua
					''
						cmp.mapping(function(fallback)
							if cmp.visible() then
              		cmp.select_next_item()
              	elseif luasnip.locally_jumpable(1) then
              		luasnip.jump(1)
              	else
              		fallback()
              	end
              end, { "i", "s" })
            '';
           "<S-Tab>" = helpers.mkRaw # lua
            ''
              cmp.mapping(function(fallback)
              	if cmp.visible() then
              		cmp.select_prev_item()
              	elseif luasnip.locally_jumpable(-1) then
              		luasnip.jump(-1)
              	else
              		fallback()
              	end
              end, { "i", "s" })
            '';
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
          { name = "cmdline"; }
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
