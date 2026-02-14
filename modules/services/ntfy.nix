let
  port = "3002";
in
{
  flake.modules.nixos.ntfy = {
    services.ntfy-sh = {
      enable = true;
      settings = {
        listen-http = ":${port}";
        base-url = "https://ntfy.macks.cloud";
      };
    };
    services.nginx.virtualHosts."ntfy.macks.cloud" = {
      forceSSL = true;
      useACMEHost = "macks.cloud";
      locations."/".proxyPass = "http://localhost:${port}";
    };
  };
}
