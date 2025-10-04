{ pkgs, ... }:
{

  home.packages = with pkgs; [
    nextcloud-client
  ];

  services.wlsunset = {
    enable = true;
    temperature.day = 5700;
    temperature.night = 4000;
    latitude = 51.1;
    longitude = 10.4;
  };

  services.nextcloud-client = {
    enable = true;
    startInBackground = true;
    package = pkgs.nextcloud-client;
  };

  services.ssh-agent.enable = true;
}
