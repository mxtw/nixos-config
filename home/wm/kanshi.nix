{
  services.kanshi = {
    enable = false;

    settings = [
      {
        profile.name = "dual";
        profile.outputs = [
          {
            criteria = "DP-1";
            position = "0,0";
            mode = "2560x1440@180Hz";
          }
          {
            criteria = "DP-2";
            position = "2560,360";
            mode = "1920x1080@144Hz";
          }
        ];
      }
    ];
  };
}
