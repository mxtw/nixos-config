{ pkgs, ... }:
{
  imports = [
    ./librewolf.nix
    ./qutebrowser
    ./zen
  ];

  home.sessionVariables.BROWSER = "librewolf";

  home.packages = with pkgs; [
    tor-browser-bundle-bin
  ];
}
