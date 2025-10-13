{
  sops.secrets.freshrss = { };
  services.freshrss = {
    enable = true;
    defaultUser = "max";
    passwordFile = "/run/secrets/freshrss";
    webserver = "caddy";
    virtualHost = "rss.macks.cloud";
    baseUrl = "https://rss.macks.cloud";
  };
}
