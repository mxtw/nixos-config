{ config, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.pavucontrol
  ];
}
