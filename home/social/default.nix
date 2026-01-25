{ pkgs, ... }:
{
  imports = [
    ./senpai.nix
  ];
  home.packages = with pkgs; [
    vesktop
    chatterino2
    streamlink
  ];
}
