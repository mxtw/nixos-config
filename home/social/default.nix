{ pkgs, ... }:
{
  imports = [
    ./iamb.nix
    ./senpai.nix
  ];
  home.packages = with pkgs; [
    vesktop
    chatterino2
    streamlink
  ];
}
