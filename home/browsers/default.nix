{ pkgs, ... }:
{
  imports = [
    ./firefox
    ./librewolf.nix
    ./qutebrowser
    ./zen
  ];

  home.sessionVariables.BROWSER = "firefox";

  home.packages = with pkgs; [
    tor-browser-bundle-bin
  ];
}
