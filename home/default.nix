{ config, pkgs, ... }:

{
  home.username = "max";
  home.homeDirectory = "/home/max";

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;

  imports = [
    ./river
    ./foot
    ./fuzzel
    ./yambar
  ];

  programs.lazygit.enable = true;

  programs.neovim = {
    enable = true;
    vimAlias = true;
    defaultEditor = true;
  };

  programs.librewolf = {
    enable = true;
  };
}
