{ pkgs, ... }:

{
  programs.steam.enable = true;
  programs.steam.extraCompatPackages = [
    pkgs.proton-ge-bin
  ];
  programs.steam.remotePlay.openFirewall = true;

  # maybe not in systempackages?
  environment.systemPackages = [
    pkgs.lutris
    pkgs.heroic
    pkgs.wine
    pkgs.wine64

    pkgs.pcsx2
  ];
}
