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
  };

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/max/code/nixos-config";
  };
}
