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
    ./mako
    ./mpv
    ./nixvim
    ./river
    ./shell
    ./yambar
  ];

  gtk = {
    enable = true;
    theme.name = "Catppuccin-GTK-Dark";
    theme.package = pkgs.magnetic-catppuccin-gtk;
  };

  programs.librewolf = {
    enable = true;
  };

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/max/code/nixos-config";
  };

  services.ssh-agent.enable = true;
}
