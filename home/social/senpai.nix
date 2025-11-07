{ config, pkgs, ... }:
let
  senpai-git = pkgs.senpai.overrideAttrs {
    version = "git";
    src = pkgs.fetchFromSourcehut {
      owner = "~delthas";
      repo = "senpai";
      rev = "8a399a916e2b1277dd792df446a0dde37d0d3c17";
      sha256 = "sha256-7vCNX5vTbZAmlpRROeeG53+L+xd4AizyQqXd2LSa1xM=";
    };
    vendorHash = "sha256-9IHUi7cCE/bfHAKezJYeAFPQaidWjSAYZqfEtbyV0hE=";
  };
in
{
  sops.secrets.soju-password = { };
  programs.senpai = {
    enable = true;
    package = senpai-git;
    config = {
      nickname = "mxtw";
      password-cmd = [ "cat" config.sops.secrets.soju-password.path ];
      address = "ircs://irc.macks.cloud:6697";
      typings = false;
      colors.nicks = "extended";
      colors.unread = "#b4befe";
      shortcuts = {
        "Alt+n" = "buffer-next-unread";
        "Alt+p" = "buffer-previous-unread";
        "Alt+d" = "scroll-next-highlight";
        "Alt+u" = "scroll-previous-highlight";
        "Control+r" = "search-editor";
      };
    };
  };
}
