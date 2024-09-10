{ inputs, ... }:

{

  home.username = "max";
  home.homeDirectory = "/home/max";

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;

  imports = [
    ./foot
    ./fuzzel
    ./nixvim
    ./river
    ./yambar
  ];

  programs.lazygit.enable = true;

  programs.librewolf = {
    enable = true;
  };
}
