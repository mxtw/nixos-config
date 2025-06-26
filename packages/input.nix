{ pkgs, ... }:
{
  programs.weylus = {
    enable = true;
    users = [ "max" ];
    openFirewall = true;
  };

  environment.systemPackages = with pkgs; [
    vial
  ];
  services.udev.packages = with pkgs; [
    vial
  ];
}
