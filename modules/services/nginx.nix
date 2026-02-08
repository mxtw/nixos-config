{
  flake.modules.nixos.nginx = { config, ... }: {
    sops.secrets."cloudflare.env" = { };
    services.nginx.enable = true;
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
    services.nginx.virtualHosts."macks.cloud" = {
      forceSSL = true;
      default = true;
      useACMEHost = "macks.cloud";
      locations."/".root = "/var/www/macks.cloud";
    };

    networking.firewall.allowedTCPPorts = [ 80 443 ];
  };
}
