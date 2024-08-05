{ config, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.wezterm
  ];
}
