{
  imports = [
    ./freshrss.nix
    ./ssh.nix
  ];

  services.caddy.enable = true;
}
