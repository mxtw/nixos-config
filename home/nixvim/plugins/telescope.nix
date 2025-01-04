{ inputs, ... }:
{
  programs.nixvim.plugins.telescope = {
    enable = true;
    keymaps = {
      "<leader><leader>" = "git_files";
      "<leader>," = "buffers";
    };
  };
}
