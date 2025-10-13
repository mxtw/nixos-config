{
  sops.secrets.freshrss = { };
  services.freshrss = {
    enable = true;
    defaultUser = "max";
    passwordFile = "/run/secrets/freshrss";
    webserver = "nginx";
    virtualHost = "rss.macks.cloud";
    baseUrl = "https://rss.macks.cloud";
  };
  services.nginx.virtualHosts."rss.macks.cloud".forceSSL = true;
  services.nginx.virtualHosts."rss.macks.cloud".enableACME = true;
}
