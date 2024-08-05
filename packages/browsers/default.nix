{ config, pkgs, unstablePkgs, ... }:

{
  environment.systemPackages = [
    pkgs.librewolf
  ];
}
