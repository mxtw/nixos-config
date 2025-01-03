{
  imports = [
    ./git.nix
    ./lsp.nix
    ./lualine.nix
    ./telescope.nix
    ./treesitter.nix
  ];
  programs.nixvim = {
    plugins.oil.enable = true;
    plugins.web-devicons.enable = true;

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
