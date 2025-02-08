{ lib, config, ... }:
with lib;
let
  cfg = config.modules.yambar;

  tagDefault = {
    stack = [
      { background.color = "00000000"; }
      { underline = { size = 3; color = "b4befeff"; }; }
    ];
  };
  riverBase = {
    left-margin = 6;
    right-margin = 6;
    default = {
      string = { text = ""; };
    };
    conditions = {
      "id == 1" = { string = { text = "1"; }; };
      "id == 2" = { string = { text = "2"; }; };
      "id == 3" = { string = { text = "3"; }; };
      "id == 4" = { string = { text = "4"; }; };
      "id == 5" = { string = { text = "5"; }; };
      "id == 6" = { string = { text = "6"; }; };
      "id == 7" = { string = { text = "7"; }; };
      "id == 8" = { string = { text = "8"; }; };
      "id == 9" = { string = { text = "9"; }; };
    };
  };
in
{
  options.modules.yambar = {
    enable = mkEnableOption "yambar";
    layout = mkEnableOption "yambar";
    pulse = mkEnableOption "yambar";
    cpu = mkEnableOption "yambar";
    mem = mkEnableOption "yambar";
    battery = mkEnableOption "yambar";
    clock = mkEnableOption "yambar";
  };

  config = mkIf cfg.enable {
    programs.yambar.enable = true;
    programs.yambar.settings = {

      bar = {
        location = "top";
        font = "Hack";
        height = 20;
        right-spacing = 6;
        right-margin = 6;
        border = {
          top-margin = 2;
          left-margin = 2;
          right-margin = 2;
        };
        background = "1e1e2ee6";
        foreground = "b4befeff";

        center = [
          {
            river.title.string.text = "{title}";
            river.title.string.max = 100;
            river.content.map.conditions = { };
          }
        ];

        left = [
          {
            river.anchors = [
              { base = riverBase; }
            ];
            river.content.map = {
              on-click = {
                left = "sh -c \"riverctl set-focused-tags $((1 << ({id} - 1)))\"";
                right = "sh -c \"riverctl toggle-focused-tags $((1 << ({id} - 1)))\"";
                middle = "sh -c \"riverctl toggle-view-tags $((1 << ({id} - 1)))\"";
              };
              conditions = {
                "state == urgent".map = riverBase // {
                  deco.background.color = "f9e2afff";
                };
                "state == focused".map = riverBase // {
                  deco = tagDefault;
                };
                "state == visible && ~occupied".map = riverBase;
                "state == focused && occupied".map = riverBase // {
                  deco = tagDefault;
                };
                "state == unfocused".map = riverBase;
                "state == invisible && ~occupied".empty = { };
                "state == invisible && occupied".map = riverBase // {
                  deco.underline = {
                    size = 3;
                    color = "00000000";
                  };
                };
              };
            };
          }
        ];

        right = [ ]

          ++ (if cfg.layout then [
          {
            river.title.string.text = "{layout}";
            river.content.map.conditions = { };
          }
        ] else [ ])

          ++ (if cfg.pulse then [
          {
            pulse.content.map = {
              conditions = {
                "source_muted && sink_muted".string = {
                  text = "vol muted mic muted";
                  foreground = "f9e2afff";
                };
                source_muted.string = {
                  text = "vol {sink_percent}% mic muted";
                  foreground = "f9e2afff";
                };
                sink_muted.string = {
                  text = "vol muted mic {source_percent}%";
                  foreground = "f9e2afff";
                };
                online.string = {
                  text = "vol {sink_percent}% mic {source_percent}%";
                  foreground = "f9e2afff";
                };
              };
              on-click.left = "pavucontrol";
            };
          }
        ] else [ ])

          ++ (if cfg.cpu then [
          {
            cpu = {
              poll-interval = 2500;
              content.map.conditions."id < 0" = [
                {
                  string.text = "cpu {cpu}%";
                  string.foreground = "a6e3a1ff";
                }
              ];
            };
          }
        ] else [ ])

          ++ (if cfg.mem then [
          {
            mem.poll-interval = 2500;
            mem.content.string = {
              text = "mem {used:gb}gb";
              foreground = "89dcebff";
            };
          }
        ] else [ ])

          ++ (if cfg.battery then [{
          battery.name = "BAT0";
          battery.content.string = {
            text = "bat {capacity}% ({estimate} rem)";
            foreground = "74c7ecff";
          };
        }] else [ ])

          ++ (if cfg.clock then [{
          clock = {
            time-format = "%H:%M";
            date-format = "%Y-%m-%d";
            content.string = {
              text = "{date} {time}";
              foreground = "f38ba8ff";
            };
          };
        }] else [ ]);
      };
    };

    home.file = {
      "${config.xdg.configHome}/yambar/launch.sh" = {
        text = ''
          #!/bin/sh
          killall yambar

          monitors=$(wlr-randr | grep "^[^ ]" | awk '{ print$1 }')
          total=$(wlr-randr | grep "^[^ ]" | awk '{ print$1 }' | wc -l)

          for monitor in $monitors; do
              riverctl focus-output $monitor
              yambar &
              sleep 0.2
          done
        '';
        executable = true;
      };
    };
  };
}
