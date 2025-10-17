{ inputs, pkgs, config, ... }:

{
  home.username = "max";
  home.homeDirectory = "/home/max";

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;

  imports = [
    inputs.sops-nix.homeManagerModules.sops
    ./browsers
    ./cli
    ./dev
    ./media
    ./nixvim
    ./scripts
    ./secrets
    ./services
    ./social
    ./terminal
    ./wm
  ];

  sops.age.keyFile = "${config.xdg.configHome}/sops/age/keys.txt";
  sops.defaultSopsFile = ../secrets.yaml;

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
    wlr-randr
    slurp
    ffmpeg
    yt-dlp
    pandoc
    imagemagick
  ];
}
