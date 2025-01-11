{ config, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.git
    pkgs.stow
    pkgs.gnumake

    pkgs.fzf
    pkgs.killall
    # unstablePkgs.neovim

    pkgs.htop
    pkgs.btop

    pkgs.xclip
    pkgs.wl-clipboard
  ];
}
