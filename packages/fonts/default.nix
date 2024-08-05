{ config, pkgs, ... }:

{
  fonts.packages = with pkgs; [
    hack-font
    (nerdfonts.override {
      fonts = [ "Hack" ];
    })
  ];
}
