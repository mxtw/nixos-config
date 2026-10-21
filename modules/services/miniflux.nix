{
  flake.modules.nixos.miniflux = { config, ... }:
    let
      socket = "/dev/shm/miniflux.sock";
    in
    {
      sops.secrets.miniflux-credentials = { };
      services.miniflux = {
        enable = true;
        adminCredentialsFile = config.sops.secrets.miniflux-credentials.path;
        config = {
          LISTEN_ADDR = socket;
          BASE_URL = "https://rss.macks.cloud";
        };
      };
      users.users.miniflux = {
        isSystemUser = true;
        group = "miniflux";
      };
      users.groups.miniflux = { };
      users.users.nginx.extraGroups = [ "miniflux" ];
      services.nginx.virtualHosts."rss.macks.cloud" = {
        forceSSL = true;
        useACMEHost = "macks.cloud";
        locations."/".proxyPass = "http://unix:${socket}";
      };
    };
}
