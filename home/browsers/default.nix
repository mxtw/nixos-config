{ pkgs, ... }:
{
  imports = [
    ./librewolf.nix
    ./qutebrowser.nix
  ];

  home.sessionVariables.BROWSER = "librewolf";

  home.packages = with pkgs; [
    tor-browser-bundle-bin
  ];
}
