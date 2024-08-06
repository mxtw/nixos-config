{ config, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.librewolf
  ];
}
