{
  flake.modules.homeManager.hyprlock = {
    programs.hyprlock = {
      enable = true;
      settings = {
        input-field = [
          {
            outline_thickness = 2;
            outer_color = "rgb(ebdbb2)";
            check_color = "rgb(b8bb26)";
            fail_color = "rgb(fb4934)";
            inner_color = "rgba(2828280a)";
            font_color = "rgb(ebdbb2)";
            position = "0, -120";
            fade_on_empty = false;
            size = "300, 40";
            rounding = -1;
          }
        ];
        background = {
          color = "rgb(282828)";
          path = "screenshot";
          blur_passes = 4;
          brightness = 0.5;
        };
        label = [
          {
            color = "rgb(ebdbb2)";
            font_size = "100";
            position = "0, 50";
            text = "cmd[update:1000] date +%H:%M:%S";
          }
          {
            color = "rgb(ebdbb2)";
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
  };
}
