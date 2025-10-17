{ config, ... }:
{
  sops.secrets."zipline.env" = { };
  services.zipline = {
    enable = true;
    settings.DATASOURCE_TYPE = "local";
    settings.DATASOURCE_LOCAL_DIRECTORY = "/data/zipline";
    environmentFiles = [ config.sops.secrets."zipline.env".path ];
  };

  services.nginx.virtualHosts."files.macks.cloud" = {
    forceSSL = true;
    useACMEHost = "macks.cloud";
    locations."/".proxyPass = "http://localhost:3000";
  };
}
