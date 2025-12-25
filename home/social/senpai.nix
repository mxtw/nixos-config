{ config, pkgs, ... }:
let
  senpai-git = pkgs.senpai.overrideAttrs {
    version = "git";
    src = pkgs.fetchFromSourcehut {
      owner = "~delthas";
      repo = "senpai";
      rev = "c19e012fd4322817867ac8f89916401a7a1c31cb";
      sha256 = "sha256-xp+AorpVXlZ+WhoqZ8Cf7H5JYUtvM7k0STaEGBjOouI=";
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
