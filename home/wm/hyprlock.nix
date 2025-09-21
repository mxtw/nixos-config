{
  programs.hyprlock = {
    enable = true;
    settings = {
      input-field = [
        {
          outline_thickness = 2;
          outer_color = "rgb(b4befe)";
          inner_color = "rgba(1e1e2e0a)";
          font_color = "rgb(b4befe)";
          position = "0, 0";
          fade_on_empty = false;
          size = "200, 40";
          rounding = -1;
        }
      ];
      background = {
        color = "rgb(1e1e2e)";
        path = "screenshot";
        blur_passes = 4;
      };
      label = [
        {
          color = "rgb(b4befe)";
          font_size = "50";
          position = "0, 100";
          text = "cmd[update:1000] date +%r";
        }
        {
          color = "rgb(b4befe)";
          font_size = "20";
          position = "0, 50";
          text = "cmd[update:10000] date +'%a, %x'";
        }
      ];
    };
  };
}
