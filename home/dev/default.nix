{ pkgs, ... }:
{
  # define a bunch of language tooling here because i cba setting up flakes for every throwaway thing
  home.packages = with pkgs; [
    gcc
    gnumake

    python3
    uv

    cargo
    rustc

    go

    devenv
  ];
}
