{ pkgs, config, ... }:
{
  home.packages = [
    pkgs.xwayland-satellite
  ];

  home.file."${config.xdg.configHome}/niri/config.kdl".source = ../configs/niri.kdl;
}
