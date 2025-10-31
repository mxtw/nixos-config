{ config, pkgs, ... }:

{
  fonts.packages = with pkgs; [
    dejavu_fonts
    noto-fonts
    noto-fonts-color-emoji
    hack-font
    nerd-fonts.hack

  ];
}
