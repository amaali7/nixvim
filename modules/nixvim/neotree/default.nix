{ helpers, ... }: {
  keymaps = [
    {
      mode = [ "n" "v" ];
      action = "<cmd>Neotree toggle<CR>";
      key = "<C-n>";
      options = {
        desc = "Neotree: Toggle";
        silent = true;
        noremap = true;
      };
    }

    {
      mode = [ "n" "v" ];
      action = "<cmd>Neotree filesystem reveal left<CR>";
      key = "<leader>nn";
      options = {
        desc = "Neotree: Open";
        silent = true;
        noremap = true;
      };
    }
    {
      mode = [ "n" "v" ];
      action = "<cmd>Neotree document_symbols<CR>";
      key = "<leader>ns";
      options = {
        desc = "Neotree: Document Symbols";
        silent = true;
        noremap = true;
      };
    }
    {
      mode = [ "n" "v" ];
      action = "<cmd>Neotree focus<CR>";
      key = "<leader>e";
      options = {
        desc = "Neotree: Focus";
        silent = true;
        noremap = true;
      };
    }
  ];

  plugins.neo-tree = {
    enable = true;
    sources = [ "filesystem" "buffers" "git_status" "document_symbols" ];
  };
}
