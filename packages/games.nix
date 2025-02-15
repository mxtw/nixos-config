{ pkgs, lib, ... }:
let
  aagl-gtk-on-nix = import (builtins.fetchTarball {
    url = "https://github.com/ezKEa/aagl-gtk-on-nix/archive/main.tar.gz";
    sha256 = "0v59frhfnyy7pbmbv7bdzssdp554bjsgmmm4dw31p5askysmlvib";
  });
in
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

  imports = [
    aagl-gtk-on-nix.module
  ];

  programs.honkers-railway-launcher.enable = true;
}
