{ inputs, pkgs, ... }:

{
  home.username = "max";
  home.homeDirectory = "/home/max";

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;

  imports = [
    ./browsers
    ./cli
    ./dev
    ./media
    ./nixvim
    ./scripts
    ./services
    ./social
    ./terminal
    ./wm
  ];

  gtk = {
    enable = true;
    theme.name = "rose-pine";
    theme.package = pkgs.rose-pine-gtk-theme;
    iconTheme.name = "rose-pine";
    iconTheme.package = pkgs.rose-pine-icon-theme;
    cursorTheme.name = "rose-pine";
    cursorTheme.package = pkgs.rose-pine-cursor;
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
