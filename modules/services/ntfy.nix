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
        auth-default-access = "deny-all";
        auth-file = "/var/lib/ntfy-sh/user.db";
      };
    };
    services.nginx.virtualHosts."ntfy.macks.cloud" = {
      forceSSL = true;
      useACMEHost = "macks.cloud";
      locations."/".proxyPass = "http://localhost:${port}";
    };
  };
}
