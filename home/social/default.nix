{ pkgs, ... }:
{
  imports = [
    ./halloy.nix
    ./iamb.nix
    ./senpai.nix
  ];
  home.packages = with pkgs; [
    vesktop
    chatterino2
    streamlink
  ];
}
