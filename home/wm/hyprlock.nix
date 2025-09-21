{
  programs.hyprlock = {
    enable = true;
    settings = {
      input-field = [
        {
          outline_thickness = 2;
          outer_color = "rgb(b4befe)";
          inner_color = "rgba(1e1e2e0a)";
          font_color = "rgb(cdd6f4)";
          position = "0, 0";
          fade_on_empty = false;
          size = "200, 50";
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
          color = "rgb(cdd6f4)";
          font_size = "70";
          position = "0, 150";
          text = "cmd[update:1000] date +%r";
        }
        {
          color = "rgb(cdd6f4)";
          font_size = "20";
          position = "0, 80";
          text = "cmd[update:10000] date +'%a, %x'";
        }
      ];
    };
  };

  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";
        before_sleep_cmd = "loginctl lock-session";
      };
      listener = [
        {
          timeout = "90";
          on-timeout = "brightnessctl -s set 10";
          on-resume = "brightnessctl -r";
        }
        {
          timeout = "300";
          on-timeout = "loginctl lock-session";
        }
      ];
    };
  };
}
