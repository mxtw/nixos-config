{ pkgs, ... }:
let
  kubectl-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "kubectl.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "Ramilito";
      repo = "kubectl.nvim";
      rev = "v1.14.2";
      sha256 = "BD9RWwpQbvN521/KgbDj7sDCK3nUEqokuQuzl4iCZTU=";
    };
  };
in
{
  programs.nixvim = {
    extraPlugins = [
      kubectl-nvim
    ];

    extraConfigLua = ''
      require("kubectl").setup({})
    '';


    keymaps = [
      {
        action.__raw = ''function() require("kubectl").toggle() end'';
        key = "<leader>kk";
      }
    ];
  };
}
