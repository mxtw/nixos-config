{ config, ... }:
{
  sops.secrets.soju-password = { };
  programs.senpai = {
    enable = true;
    config = {
      nickname = "mxtw";
      password-cmd = [ "cat" config.sops.secrets.soju-password.path ];
      address = "ircs://irc.macks.cloud:6697";
      typings = false;
      colors.nicks = "extended";
      colors.unread = "#b4befe";
    };
  };
}
