{ pkgs, ... }:
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

    pcsx2
    rpcs3
  ];
}
