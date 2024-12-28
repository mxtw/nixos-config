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
        right-spacing = 6;
        right-margin = 6;

        border = {
          top-margin = 2;
          left-margin = 2;
          right-margin = 2;
        };

        left = [
          {
            river = {
              anchors = [
                {
                  base = {
                    left-margin = 6;
                    right-margin = 6;
                    default.string.text = "";
                    conditions = {
                      "id == 1".string.text = 1;
                      "id == 2".string.text = 2;
                      "id == 3".string.text = 3;
                      "id == 4".string.text = 4;
                      "id == 5".string.text = 5;
                      "id == 6".string.text = 6;
                      "id == 7".string.text = 7;
                      "id == 8".string.text = 8;
                      "id == 9".string.text = 9;
                    };
                  };
                }
              ];

              content = {
                map = {
                  conditions = {
                    "state == focused" = {
                      map = {
                        left-margin = 6;
                        right-margin = 6;
                        default.string.text = "";
                        conditions = {
                          "id == 1".string.text = 1;
                          "id == 2".string.text = 2;
                          "id == 3".string.text = 3;
                          "id == 4".string.text = 4;
                          "id == 5".string.text = 5;
                          "id == 6".string.text = 6;
                          "id == 7".string.text = 7;
                          "id == 8".string.text = 8;
                          "id == 9".string.text = 9;
                        };
                      };
                    };
                  };
                };
              };
            };
          }
        ];

        center = [
          {
            river = {
              title.string.text = "{title}";
              title.string.max = 100;
              content.map.conditions = { };
            };
          }
        ];

        right = [
          {
            battery = {
              name = "BAT0";
              content = {
                string = {
                  text = "bat {capacity}% ({estimate} rem)";
                  foreground = "74c7ecff";
                };
              };
            };
          }
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
  };
}
