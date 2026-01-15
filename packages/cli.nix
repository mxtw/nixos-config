{ config, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.git
    pkgs.fzf
    pkgs.killall
    pkgs.htop
    pkgs.btop
    pkgs.xclip
    pkgs.wl-clipboard
    # for secure boot
    pkgs.sbctl
  ];

  programs.mosh.enable = true;
}
