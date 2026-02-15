{
  flake.modules.homeManager.tmux = { pkgs, ... }:
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
          rtpFilePath = "tmux-fzf-ssh.tmux";
        };
      # see https://github.com/NixOS/nixpkgs/pull/484230#issuecomment-3879409094
      session-wizard-fixed = pkgs.tmuxPlugins.session-wizard.overrideAttrs (previousAttrs: {
        buildInputs = (previousAttrs.buildInputs or [ ]) ++ [ pkgs.bashNonInteractive ];
      });
    in
    {
      programs.tmux = {
        enable = true;
        keyMode = "vi";
        mouse = true;
        baseIndex = 1;
        escapeTime = 0;
        terminal = "foot";
        extraConfig = (builtins.readFile ../configs/tmux.conf);
        plugins = with pkgs; [
          {
            plugin = tmuxPlugins.yank;
            extraConfig = "set -g @yank_action 'copy-pipe'";
          }
          {
            plugin = session-wizard-fixed;
            extraConfig = "set -g @session-wizard 'm'";
          }
          tmuxPlugins.better-mouse-mode
          tmuxPlugins.jump
          tmux-fzf-ssh
        ];
      };
    };
}
