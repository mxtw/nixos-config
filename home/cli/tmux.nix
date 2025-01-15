{ pkgs, ... }:
let
  # custom plugins
  tmux-fzf-ssh = pkgs.tmuxPlugins.mkTmuxPlugin
    {
      pluginName = "tmux-fzf-ssh";
      version = "0.1.0";
      src = pkgs.fetchFromGitHub
        {
          owner = "mxtw";
          repo = "tmux-fzf-ssh";
          rev = "07f58a69b722b8da2e8c6343b00e0418b8ca0dec";
          sha256 = "sha256-+6jtoUr989Ky2pDlvBuPvTOQG29XYZKuP5fs4oe0DUw=";
        };
    };
in
{
  home.packages = with pkgs; [
    sesh
  ];
  programs.tmux = {
    enable = true;
    prefix = "C-a";
    keyMode = "vi";
    mouse = true;
    baseIndex = 1;
    escapeTime = 0;
    terminal = "foot";
    extraConfig = (builtins.readFile ./tmux.conf);
    plugins = with pkgs; [
      {
        plugin = tmuxPlugins.extrakto;
        extraConfig = "set -g @extrakto_popup_size '40%'";
      }
      {
        plugin = tmuxPlugins.continuum;
        extraConfig = "set -g @continuum-save-interval '5'";
      }
      {
        plugin = tmuxPlugins.resurrect;
        extraConfig = "set -g @resurrect-capture-pane-contents 'on'";
      }
      {
        plugin = tmuxPlugins.yank;
        extraConfig = "set -g @yank_action 'copy-pipe'";
      }
      tmuxPlugins.better-mouse-mode
      tmux-fzf-ssh
    ];
  };
}
