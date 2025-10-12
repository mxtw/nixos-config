{ config, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.age
    pkgs.sops
    pkgs.gnupg
  ];

  programs.gnupg.agent.enable = true;
}
