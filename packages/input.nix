{ pkgs, ... }:
{
  programs.weylus = {
    enable = true;
    users = [ "max" ];
    openFirewall = true;
  };

  environment.systemPackages = with pkgs; [
    vial
    via
  ];
  services.udev.packages = with pkgs; [
    vial
    via
  ];
}
