{ config, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.age
    pkgs.sops
    pkgs.gnupg
  ];
}
