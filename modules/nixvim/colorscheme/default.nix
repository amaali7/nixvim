{ helpers, ... }:
{
  # colorschemes.oxocarbon.enable = true;
	# extraConfigLuaPost = # lua
  #   ''
  #     do
  #       -- The NixVim Nord colorscheme doesn't assign a pleasing color to the window
  #       -- separator by default. Here we override it with a softer color.
  #       local colors = require("nord.colors")
  #       vim.api.nvim_set_hl(0,  "WinSeparator", {
  #         fg = colors.nord2_gui,
  #       })
  #     end
  #   '';

colorschemes.onedark = {
    enable = false;
    settings = {
			style = "warmer";
    };
  };
}
