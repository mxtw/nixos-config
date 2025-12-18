{ pkgs, ... }:
{
  imports = [
    ./firefox
    ./qutebrowser
  ];

  home.sessionVariables.BROWSER = "firefox";

  home.packages = with pkgs; [
    tor-browser
    w3m
    chawan
  ];
}
