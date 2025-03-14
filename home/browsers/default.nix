{ pkgs, ... }:
{
  imports = [
    ./librewolf.nix
    ./qutebrowser.nix
  ];

  home.packages = with pkgs; [
    tor-browser-bundle-bin
  ];
}
