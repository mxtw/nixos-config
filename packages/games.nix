{ pkgs, ... }:
let
  tome-fixed = pkgs.tome4.overrideAttrs (oldAttrs: {
    env.NIX_CFLAGS_COMPILE = oldAttrs.env.NIX_CFLAGS_COMPILE + " -Wno-error=incompatible-pointer-types -Wno-error=implicit-function-declaration";
    buildInputs = oldAttrs.buildInputs ++ [ pkgs.xorg.libX11 ];
  });
in
{
  programs.steam = {
    enable = true;
    extraCompatPackages = [
      pkgs.proton-ge-bin
    ];
    remotePlay.openFirewall = true;
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
    prismlauncher
    bolt-launcher
    gnome-mahjongg
    tome-fixed

    pcsx2
    rpcs3
  ];
}
