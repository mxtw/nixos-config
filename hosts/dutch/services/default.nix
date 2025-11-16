{ config, ... }:
{
  imports = [
    ./cgit.nix
    ./freshrss.nix
    ./games
    ./irc.nix
    ./linkding.nix
    ./ssh.nix
    ./task.nix
    ./zipline.nix
  ];

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
}
