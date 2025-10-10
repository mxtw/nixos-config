{
  imports = [
    ./freshrss.nix
    ./linkding.nix
    ./ssh.nix
    ./zipline.nix
  ];

  services.caddy.enable = true;
}
