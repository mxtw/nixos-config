{ config, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.pavucontrol
    pkgs.pamixer
  ];
}
