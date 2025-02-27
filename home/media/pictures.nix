{ pkgs, ... }:
{
  programs.feh.enable = true;

  home.packages = with pkgs; [
    krita
    pinta
  ];
}
