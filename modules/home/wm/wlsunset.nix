{
  flake.modules.homeManager.wlsunset = {
    services.wlsunset = {
      enable = true;
      temperature.day = 5700;
      temperature.night = 4000;
      latitude = 51.1;
      longitude = 10.4;
    };
  };
}
