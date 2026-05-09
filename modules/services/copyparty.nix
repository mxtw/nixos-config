{ inputs, ... }: {
  flake.modules.nixos.copyparty = { config, ... }:
    let
      socket = "/dev/shm/party.sock";
    in
    {
      imports = [ inputs.copyparty.nixosModules.default ];

      sops.secrets.copyparty_max = { owner = config.users.users.copyparty.name; };
      users.users.nginx.extraGroups = [ "copyparty" ];
      services.copyparty = {
        enable = true;
        settings = {
          i = "unix:770:${socket}";
          rm-sck = true;
          rproxy = 1;
          usernames = true;
          name = "files";
          name-url = "https://files.macks.cloud/";
        };
        accounts.max.passwordFile = config.sops.secrets.copyparty_max.path;
        volumes = {
          "/" = {
            path = "/data/files/public";
            access = {
              r = "*";
              A = [ "max" ];
            };
          };
          "/private" = {
            path = "/data/files/private";
            access.A = [ "max" ];
          };
          "/ss" = {
            path = "/data/files/ss";
            access = {
              A = [ "max" ];
              g = "*";
            };
            flags = {
              rand = true;
              nrand = 8;
            };
          };
          "/tmp" = {
            path = "/data/files/tmp";
            access = {
              A = [ "max" ];
              g = "*";
            };
            flags = {
              rand = true;
              nrand = 8;
              fk = 8;
              pk = true;
              lifetime = 86400;
            };
          };
        };
      };

      services.nginx = {
        clientMaxBodySize = "1024M";
        virtualHosts."files.macks.cloud" = {
          forceSSL = true;
          useACMEHost = "macks.cloud";
          locations."/" = {
            extraConfig = ''
              proxy_redirect off;
              proxy_http_version 1.1;
              proxy_buffering off;
              proxy_request_buffering off;
              proxy_buffers 32 8k;
              proxy_buffer_size 16k;
              proxy_busy_buffers_size 24k;
            '';
            proxyPass = "http://unix:${socket}";
          };
        };
      };
    };
}
