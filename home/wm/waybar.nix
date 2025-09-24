{ lib, config, ... }:
with lib;
let
  cfg = config.modules.waybar;
in
{
  options.modules.waybar = {
    enable = mkEnableOption "waybar";
  };

  config = mkIf cfg.enable {
    home.file."${config.xdg.configHome}/waybar/mocha.css" = {
      source = builtins.fetchurl
        {
          url = "https://raw.githubusercontent.com/catppuccin/waybar/ee8ed32b4f63e9c417249c109818dcc05a2e25da/themes/mocha.css";
          sha256 = "05yx7v4j9k1s1xanlak7yngqfwvxvylwxc2fhjcfha68rjbhbqx6";
        };
    };
    programs.waybar = {
      enable = true;

      settings = {
        main = {
          layer = "top";
          position = "top";
          height = 20;

          modules-left = [ "river/tags" ];
          modules-center = [ "river/window" ];
          modules-right = [ "river/layout" "pulseaudio" "cpu" "memory" "clock" "tray" ];

          "river/tags".hide-vacant = true;
          "river/window".separate-outputs = true;
          tray.spacing = 10;
          tray.show-passive-items = true;
          tray.icon-size = 12;

          clock = {
            timezone = "Europe/Berlin";
            tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
            format = "{:%Y-%m-%d %H:%M}";
          };

          cpu.format = "cpu {usage}%";
          memory.format = "mem {used:.1f}gb";
          pulseaudio = {
            format = "vol {volume}% {format_source}";
            format-source = "mic {volume}%";
            on-click = "pavucontrol";
          };
        };
      };
      style = ./waybar-style.css;
    };
  };
}
