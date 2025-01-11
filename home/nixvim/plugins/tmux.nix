{ pkgs, ... }:
{
  programs.nixvim.extraPlugins = [
    pkgs.vimPlugins.tmux-nvim
  ];
  programs.nixvim.extraConfigLua = ''
    require("tmux").setup({
        navigation = {
            enable_default_keybinds = false
        }
    })
  '';

  programs.nixvim.keymaps = [
    {
      action.__raw = ''function() require("tmux").move_left() end'';
      key = "<M-Left>";
    }
    {
      action.__raw = ''function() require("tmux").move_right() end'';
      key = "<M-Right>";
    }
    {
      action.__raw = ''function() require("tmux").move_top() end'';
      key = "<M-Up>";
    }
    {
      action.__raw = ''function() require("tmux").move_bottom() end'';
      key = "<M-Down>";
    }
  ];

}
