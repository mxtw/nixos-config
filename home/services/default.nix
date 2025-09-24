{ pkgs, ... }:
{

  home.packages = with pkgs; [
    nextcloud-client
  ];

  services.gammastep = {
    enable = true;
    temperature.day = 5700;
    temperature.night = 4000;
    provider = "geoclue2";
  };

  services.nextcloud-client = {
    enable = true;
    startInBackground = true;
    package = pkgs.nextcloud-client;
  };

  services.ssh-agent.enable = true;
}
