{
  programs.nixvim.plugins = {
    lazygit.enable = true;

    gitsigns = {
      enable = true;
      settings.signcolumn = true;
    };
  };

  programs.nixvim.keymaps = [
    {
      action = "<cmd>LazyGit<CR>";
      key = "<leader>gg";
      options = {
        silent = true;
      };
    }
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
      action = "<cmd>Gitsigns toggle_current_line_blame<CR>";
      key = "<leader>gb";
      options = {
        silent = true;
      };
    }
  ];
}
