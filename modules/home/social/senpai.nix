{
  flake.modules.homeManager.senpai = { config, ... }: {
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
        shortcuts = {
          "Alt+n" = "buffer-next-unread";
          "Alt+p" = "buffer-previous-unread";
          "Alt+d" = "scroll-next-highlight";
          "Alt+u" = "scroll-previous-highlight";
          "Control+r" = "search-editor";
        };
        pane-widths = {
          channels = -16;
          members = -16;
        };
      };
    };
  };
}
