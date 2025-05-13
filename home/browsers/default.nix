{ pkgs, ... }:
{
  imports = [
    ./librewolf.nix
    ./qutebrowser
  ];

  home.sessionVariables.BROWSER = "librewolf";

  home.packages = with pkgs; [
    tor-browser-bundle-bin
  ];
}
