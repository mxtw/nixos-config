let
  port = "3001";
in
{
  flake.modules.nixos.uptime = {
    services.uptime-kuma = {
      enable = true;
      settings = {
        HOST = "127.0.0.1";
        PORT = port;
      };
    };
    services.nginx.virtualHosts."uptime.macks.cloud" = {
      forceSSL = true;
      useACMEHost = "macks.cloud";
      locations."/".proxyPass = "http://localhost:${port}";
    };
  };
}
