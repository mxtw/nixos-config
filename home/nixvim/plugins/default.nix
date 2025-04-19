{
  imports = [
    ./ai.nix
    ./flash.nix
    ./git.nix
    ./lsp.nix
    ./lualine.nix
    ./misc.nix
    ./noice.nix
    ./obsidian.nix
    ./oil.nix
    ./snacks.nix
    ./tmux.nix
    ./treesitter.nix
  ];
  programs.nixvim = {
    plugins.web-devicons.enable = true;
  };
}
