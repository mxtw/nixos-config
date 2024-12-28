{ config, pkgs, ... }:

{
  fonts.packages = with pkgs; [
    hack-font
    nerd-fonts.hack

  ];
}
