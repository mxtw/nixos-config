{ config, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.keepassxc
    pkgs.age
    pkgs.sops
  ];
}
