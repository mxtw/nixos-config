{ config, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.git
    pkgs.stow
    pkgs.gnumake

    pkgs.fzf
    pkgs.killall
    # unstablePkgs.neovim
  ];
}
