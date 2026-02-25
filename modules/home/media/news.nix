{
  flake.modules.homeManager.news = { inputs, pkgs, config, ... }:
    let
      eilmeldung-pkgs = import pkgs.path {
        system = pkgs.stdenv.hostPlatform.system;
        overlays = [ inputs.eilmeldung.overlays.default ];
      };
    in
    {
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

          freshrss-flag-star "s"
          freshrss-min-items 100
          include "${config.sops.secrets.newsboat-config.path}"

          color listnormal         color15 default
          color listnormal_unread  color2  default
          color listfocus_unread   color2  color0
          color listfocus          default color0
          color background         default default
          color article            default default
          color end-of-text-marker color8  default
          color info               color4  color8
          color hint-separator     default color8
          color hint-description   default color8
          color title              color14 color8

          highlight article "^(Feed|Title|Author|Link|Date): .+" color4 default bold
          highlight article "^(Feed|Title|Author|Link|Date):" color14 default bold

          highlight article "\\((link|image|video)\\)" color8 default
          highlight article "https?://[^ ]+" color4 default
          highlight article "\[[0-9]+\]" color6 default bold
        '';
      };
      programs.fish.shellAbbrs.nb = "newsboat";

      imports = [ inputs.eilmeldung.homeManager.default ];
      sops.secrets.freshrss-secret = { };
      programs.eilmeldung = {
        enable = true;
        package = eilmeldung-pkgs.eilmeldung;
        settings = {
          article_scope = "unread";
          feed_list_scope = "unread";
          startup_commands = [ "sync" ];
          after_sync_commands = [ "collapse all" "expandcategories unread" ];
          login_setup = {
            login_type = "direct_password";
            provider = "freshrss";
            user = "max";
            url = "https://rss.macks.cloud/api/greader.php/";
            password = "cmd:cat ${config.sops.secrets.freshrss-secret.path}";
          };
        };
      };
    };
}
