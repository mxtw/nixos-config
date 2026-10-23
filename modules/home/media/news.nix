{
  flake.modules.homeManager.news = { config, ... }: {
    sops.secrets.newsboat-config = { };
    programs.newsboat = {
      enable = true;
      autoReload = true;
      extraConfig = ''
        refresh-on-startup "yes"
        confirm-mark-feed-read "no"
        show-read-feeds "no"
        show-read-articles "no"
        cleanup-on-quit "yes"

        bind o everywhere set browser "cha" ; open-in-browser -- "Open in chawan"
        bind O everywhere set browser "firefox" ; open-in-browser -- "Open in firefox"

        miniflux-flag-save "s"
        miniflux-min-items 100
        include "${config.sops.secrets.newsboat-config.path}"
      '';
    };
    programs.fish.shellAbbrs.nb = "newsboat";
  };
}
