{
  programs.nixvim.plugins = {
    gitsigns = {
      enable = true;
      settings.signcolumn = true;
    };
  };

  programs.nixvim.keymaps = [
    {
      action = "<cmd>Gitsigns reset_hunk<CR>";
      key = "<leader>gr";
      options = {
        silent = true;
      };
    }
    {
      action = "<cmd>Gitsigns preview_hunk_inline<CR>";
      key = "<leader>gp";
      options = {
        silent = true;
      };
    }
    {
      action = "<cmd>Gitsigns blame<CR>";
      key = "<leader>gb";
      options = {
        silent = true;
      };
    }
    {
      action = "<cmd>Gitsigns blame_line<CR>";
      key = "<leader>gB";
      options = {
        silent = true;
      };
    }
  ];
}
