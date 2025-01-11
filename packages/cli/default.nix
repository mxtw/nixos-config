{ config, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.git
    pkgs.stow
    pkgs.gnumake

    # TODO move to home manager
    pkgs.tmux
    pkgs.sesh

    pkgs.fzf
    pkgs.killall
    # unstablePkgs.neovim
  ];
}
