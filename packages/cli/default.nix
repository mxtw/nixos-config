{ config, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.git
    pkgs.stow
    pkgs.gnumake
    pkgs.gcc
    pkgs.cargo
    pkgs.nodejs_22
    pkgs.tmux

   # unstablePkgs.neovim
  ];
}
