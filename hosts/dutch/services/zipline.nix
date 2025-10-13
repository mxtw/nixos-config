{
  sops.secrets."zipline.env" = { };
  services.zipline = {
    enable = true;
    settings.DATASOURCE_TYPE = "local";
    settings.DATASOURCE_LOCAL_DIRECTORY = "/data/zipline";
    environmentFiles = [ "/run/secrets/zipline.env" ];
  };

  services.caddy.virtualHosts = {
    "files.macks.cloud".extraConfig = ''
      reverse_proxy http://localhost:3000
    '';
  };
}
