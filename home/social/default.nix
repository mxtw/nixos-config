{ pkgs, ... }:
{
  home.packages = with pkgs; [
    vesktop
    weechat

    chatterino2
    streamlink
  ];
}
