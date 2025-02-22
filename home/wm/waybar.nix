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
    home.file."${config.xdg.configHome}/waybar/rose-pine.css" = {
      source = builtins.fetchurl
        {
          url = "https://raw.githubusercontent.com/rose-pine/waybar/1b118bd60d1c5778dc8a82b919069eeb8a834604/rose-pine.css";
          sha256 = "0alrdjdyyajrqs24f51xn1k467vygbxihkr6p64amb0p70xfhxkf";
        };
    };
    programs.waybar = {
      enable = true;

      settings = {
        main = {
          layer = "top";
          position = "top";
          height = 20;

          modules-left = [ "hyprland/workspaces" ];
          modules-center = [ "hyprland/window" ];
          modules-right = [ "pulseaudio" "cpu" "memory" "clock" "tray" ];

          "hyprland/workspaces".all-outputs = false;
          "hyprland/window".separate-outputs = true;
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
