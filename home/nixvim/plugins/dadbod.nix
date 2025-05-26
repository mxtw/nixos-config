{
  programs.nixvim = {
    plugins = {
      vim-dadbod.enable = true;
      vim-dadbod-completion.enable = true;
      vim-dadbod-ui.enable = true;
    };

    keymaps = [
      {
        action = "<cmd>DBUIToggle<cr>";
        key = "<leader>Dd";
        options.silent = true;
        options.desc = "toggle dadbod ui";
      }
    ];
  };
}
