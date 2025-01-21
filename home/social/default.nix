{ pkgs, ... }:
{
  home.packages = with pkgs; [
    vesktop
    weechat
    teamspeak5_client
  ];
}
