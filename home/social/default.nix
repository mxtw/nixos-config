{ pkgs, ... }:
{
  home.packages = with pkgs; [
    vesktop
    weechat
  ];
}
