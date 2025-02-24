{ pkgs, lib, ... }:
let
  aagl-gtk-on-nix = import (builtins.fetchTarball {
    url = "https://github.com/ezKEa/aagl-gtk-on-nix/archive/main.tar.gz";
    sha256 = "0v59frhfnyy7pbmbv7bdzssdp554bjsgmmm4dw31p5askysmlvib";
  });
in
{
  programs.steam = {
    enable = true;
    extraCompatPackages = [
      pkgs.proton-ge-bin
    ];
    remotePlay.openFirewall = true;
    gamescopeSession.enable = true;
  };
  programs.gamescope = {
    enable = true;
    capSysNice = false;
  };

  # maybe not in systempackages?
  environment.systemPackages = with pkgs; [
    lutris
    heroic
    wine
    wine64
    xivlauncher

    pcsx2
  ];

  imports = [
    aagl-gtk-on-nix.module
  ];

  programs.honkers-railway-launcher.enable = true;
}
