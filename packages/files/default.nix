{ config, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.xfce.thunar
  ];
}
