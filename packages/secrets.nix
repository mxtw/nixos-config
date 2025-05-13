{ config, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.keepassxc
    pkgs.age
    pkgs.sops
    pkgs.gnupg
  ];

  programs.gnupg.agent.enable = true;
}
