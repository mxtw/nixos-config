{ pkgs, ... }:
{
  imports = [
    ./halloy.nix
    ./senpai.nix
  ];
  home.packages = with pkgs; [
    vesktop
    chatterino2
    streamlink
  ];
}
