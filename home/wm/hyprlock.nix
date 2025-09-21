{
  programs.hyprlock = {
    enable = true;
    settings = {
      input-field = [
        {
          outline_thickness = 2;
          outer_color = "rgb(b4befe)";
          check_color = "rgb(a6e3a1)";
          fail_color = "rgb(f38ba8)";
          inner_color = "rgba(1e1e2e0a)";
          font_color = "rgb(cdd6f4)";
          position = "0, -120";
          fade_on_empty = false;
          size = "300, 40";
          rounding = -1;
        }
      ];
      background = {
        color = "rgb(1e1e2e)";
        path = "screenshot";
        blur_passes = 4;
        brightness = 0.5;
      };
      label = [
        {
          color = "rgb(cdd6f4)";
          font_size = "100";
          position = "0, 50";
          text = "cmd[update:1000] date +%H:%M:%S";
        }
        {
          color = "rgb(cdd6f4)";
          font_size = "32";
          position = "0, -50";
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
