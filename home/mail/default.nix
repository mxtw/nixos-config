{ pkgs, ... }:
{
  # need to first set it up with
  # systemctl stop --user protonmail-bridge.service
  # protonmail-bridge --cli ...
  # systemctl start --user protonmail-bridge.service
  home.packages = [ pkgs.protonmail-bridge ];
  services.protonmail-bridge.enable = true;
}
