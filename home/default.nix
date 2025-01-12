{ inputs, pkgs, ... }:

{
  home.username = "max";
  home.homeDirectory = "/home/max";

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;

  imports = [
    ./foot
    ./fuzzel
    ./git
    ./kanshi
    ./kubernetes
    ./librewolf
    ./mako
    ./mpv
    ./music
    ./nixvim
    ./river
    ./services
    ./shell
    ./social
    ./tmux
    ./yambar
  ];

  gtk = {
    enable = true;
    theme.name = "Catppuccin-GTK-Dark";
    theme.package = pkgs.magnetic-catppuccin-gtk;
    iconTheme.name = "Papirus";
    iconTheme.package = pkgs.papirus-icon-theme;
    cursorTheme.name = "catppuccin-mocha-dark-cursors";
    cursorTheme.package = pkgs.catppuccin-cursors.mochaDark;
    cursorTheme.size = 16;
  };

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/max/code/nixos-config";
  };

  home.packages = with pkgs; [
    obsidian
    sway-contrib.grimshot
    slurp
  ];
}
