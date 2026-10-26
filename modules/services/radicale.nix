{
  flake.modules.nixos.radicale = { config, ... }: {
    sops.secrets.radicale-htpasswd = {
      owner = config.users.users.radicale.name;
    };
    services.radicale = {
      enable = true;
      settings = {
        server.hosts = [ "127.0.0.1:5232" ];
        auth = {
          type = "htpasswd";
          htpasswd_filename = config.sops.secrets.radicale-htpasswd.path;
          htpasswd_encryption = "bcrypt";
        };
      };
    };
    services.nginx.virtualHosts."calendar.macks.cloud" = {
      forceSSL = true;
      useACMEHost = "macks.cloud";
      locations."/".proxyPass = "http://127.0.0.1:5232";
    };
  };
}
