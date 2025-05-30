{ pkgs, ... }:
{
  home.packages = with pkgs; [
    spotify
    strawberry
    termusic
  ];
}
