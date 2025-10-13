{
  imports = [
    ./freshrss.nix
    ./linkding.nix
    ./ssh.nix
    ./zipline.nix
  ];

  services.nginx.enable = true;
  security.acme.acceptTerms = true;
  security.acme.defaults.email = "letsencrypt@macks.cloud";
}
