{ helpers, ... }: {
  plugins.toggleterm = {
    enable = true;
    settings = {
      direction = "float";
      float_opts = {
        border = "curved";
        height = 30;
        width = 130;
      };
      open_mapping = "[[<c->]]";
      auto_scroll = false;
      autochdir = true;
      hide_numbers = true;

      size = helpers.mkRaw ''
        function(term)
          if term.direction == "horizontal" then
            return 15
          elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
          elseif term.direction == "float" then
            return vim.o.columns * 0.7
          end
        end
      '';
    };
  };
  keymaps = [
    {
      mode = [ "n" ];
      action = "<cmd>ToggleTerm<cr>";
      key = "<leader>tt";
      options = {
        desc = "ToggleTerm: Open Float";
        silent = true;
        noremap = true;
      };
    }
		{
      mode = [ "n" ];
      action = "<cmd>ToggleTerm<cr>";
      key = "<M-t>";
      options = {
        desc = "ToggleTerm: Open Float";
        silent = true;
        noremap = true;
      };
    }
    {
      mode = [ "n" ];
      action = "<cmd>ToggleTerm direction=horizontal<cr>";
      key = "<leader>th";
      options = {
        desc = "ToggleTerm: Open Horizontal";
        silent = true;
        noremap = true;
      };
    }
    {
      mode = [ "n" ];
      action = "<cmd>ToggleTerm direction=vertical<cr>";
      key = "<leader>tv";
      options = {
        desc = "ToggleTerm: Open Vertical ";
        silent = true;
        noremap = true;
      };
    }
  ];

}
