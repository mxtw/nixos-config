{ pkgs, ... }:
{
  programs.feh.enable = true;

  home.packages = with pkgs; [
    krita
    kdePackages.kolourpaint
  ];
}
