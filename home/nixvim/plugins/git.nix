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
  ];
}
