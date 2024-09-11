{
  imports = [
    ./git.nix
    ./telescope.nix
  ];
  programs.nixvim = {
    plugins.oil.enable = true;

    keymaps = [
      {
        action = "<cmd>Oil<CR>";
        key = "<leader>-";
        options = {
          silent = true;
        };
      }
    ];
  };
}
