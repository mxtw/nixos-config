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
    ./nixvim
    ./river
    ./shell
    ./yambar
  ];

  gtk = {
    enable = true;
    theme.name = "Catppuccin Mocha Lavender";
    theme.package = pkgs.catppuccin-gtk;
  };

  programs.librewolf = {
    enable = true;
  };
}
