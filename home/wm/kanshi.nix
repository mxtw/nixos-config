{
  services.kanshi = {
    enable = true;

    systemdTarget = "river-session";

    settings = [
      {
        profile.name = "dual";
        profile.outputs = [
          {
            criteria = "DP-1";
            position = "0,0";
            mode = "1920x1080@144Hz";
          }
          {
            criteria = "HDMI-A-1";
            position = "1920,0";
            mode = "1920x1080@60Hz";
          }
        ];
      }
    ];
  };
}
