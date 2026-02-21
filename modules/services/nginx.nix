{
  flake.modules.nixos.nginx = { config, ... }: {
    sops.secrets."cloudflare.env" = { };
    security.acme = {
      acceptTerms = true;
      defaults = {
        email = "letsencrypt@macks.cloud";
        dnsProvider = "cloudflare";
        environmentFile = config.sops.secrets."cloudflare.env".path;
      };
      certs = {
        "macks.cloud" = {
          domain = "macks.cloud";
          extraDomainNames = [ "*.macks.cloud" ];
          group = config.services.nginx.group;
        };
      };
    };
    services.nginx = {
      enable = true;
      recommendedProxySettings = true;
      virtualHosts = {
        "macks.cloud" = {
          forceSSL = true;
          default = true;
          useACMEHost = "macks.cloud";
          locations."/".root = "/var/www/macks.cloud";
        };
        "files.macks.cloud" = {
          forceSSL = true;
          useACMEHost = "macks.cloud";
          locations."/".root = "/var/www/files";
        };
      };
    };
    networking.firewall.allowedTCPPorts = [ 80 443 ];
  };
}
