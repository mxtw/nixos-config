{ config, ... }:
{
  imports = [
    ./cgit.nix
    ./freshrss.nix
    ./linkding.nix
    ./ssh.nix
    ./zipline.nix
  ];

  sops.secrets."cloudflare.env" = { };
  services.nginx.enable = true;
  security.acme = {
    acceptTerms = true;
    defaults.email = "letsencrypt@macks.cloud";
    certs = {
      "macks.cloud" = {
        domain = "*.macks.cloud";
        group = "nginx";
        dnsProvider = "cloudflare";
        environmentFile = config.sops.secrets."cloudflare.env".path;
      };
    };
  };
}
