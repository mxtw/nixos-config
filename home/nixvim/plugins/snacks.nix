{
  programs.nixvim.plugins.snacks = {
    enable = true;

    settings = {
      lazygit.enabled = true;
    };
  };

  programs.nixvim.keymaps = [
    {
      action.__raw = "function() Snacks.lazygit() end";
      key = "<leader>gg";
      options = {
        silent = true;
      };
    }
  ];
}
