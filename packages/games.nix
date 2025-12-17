{ pkgs, ... }:
{
  programs.steam = {
    enable = true;
    protontricks.enable = true;
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
    (lutris.override {
      extraLibraries = pkgs: [ libadwaita gtk4 ];
    })
    heroic
    wine
    wine64
    xivlauncher
    prismlauncher
    bolt-launcher
    gnome-mahjongg
    tome4
    tetrio-desktop

    pcsx2
    rpcs3
  ];
}
