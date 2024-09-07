{
  programs.yambar = {
    enable = true;
    settings = {
      bar = {
        background = "1e1e2ee6";
        foreground = "b4befeff";
        location = "top";
        font = "hack nerd font";
        height = 20;
      };

      right = [
        {
          clock = {
            time-format = "%H:%M";
            date-format = "%Y-%m-%d";
            content = {
              string = {
                text = "{date} {time}";
                foreground = "f38ba8ff";
              };
            };
          };
        }
      ];
    };
  };
}
