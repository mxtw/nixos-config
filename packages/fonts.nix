{ config, pkgs, ... }:

{
  fonts.packages = with pkgs; [
    dejavu_fonts
    noto-fonts
    noto-fonts-emoji
    noto-fonts-extra
    hack-font
    nerd-fonts.hack
    nerd-fonts.iosevka
  ];
}
