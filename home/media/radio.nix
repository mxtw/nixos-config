{ pkgs, ... }:
{
  home.packages = with pkgs; [
    sdrpp
    chirp
  ];
}

