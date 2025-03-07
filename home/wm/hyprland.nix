{ lib, config, ... }:
with lib;
let
  cfg = config.modules.hyprland;
in
{
  options.modules.hyprland = {
    enable = mkEnableOption "hyprland";
  };
  config = mkIf cfg.enable {
    wayland.windowManager.hyprland = {
      enable = true;
      systemd.enable = true;
      xwayland.enable = true;

      settings = {
        monitor = [
          "DP-1, 2560x1440@170, auto, 1, bitdepth, 10, vrr, 2"
          "DP-2, highrr, auto-right, 1"
        ];

        workspace = [
          "1,monitor:DP-1"
          "2,monitor:DP-1"
          "3,monitor:DP-1"
          "4,monitor:DP-1"
          "5,monitor:DP-1"

          "6,monitor:DP-2"
          "7,monitor:DP-2"
          "8,monitor:DP-2"
          "9,monitor:DP-2"
          "10,monitor:DP-2"
        ];

        input = {
          kb_layout = "eu";
          follow_mouse = 2;
          touchpad.natural_scroll = false;
          sensitivity = -0.7;

          repeat_rate = 50;
          repeat_delay = 300;
        };

        exec-once = [
          "waybar"
          "kiti"
        ];
        general = {
          gaps_in = 2;
          gaps_out = 2;
          border_size = 2;
          layout = "master";
          "col.active_border" = "0xffb4befe";
          "col.inactive_border" = "0xff1e1e2e";
        };


        animations = {
          enabled = true;
          bezier = [
            "linear, 0, 0, 1, 1"
            "md3_standard, 0.2, 0, 0, 1"
            "md3_decel, 0.05, 0.7, 0.1, 1"
            "md3_accel, 0.3, 0, 0.8, 0.15"
            "overshot, 0.05, 0.9, 0.1, 1.1"
            "crazyshot, 0.1, 1.5, 0.76, 0.92"
            "hyprnostretch, 0.05, 0.9, 0.1, 1.0"
            "fluent_decel, 0.1, 1, 0, 1"
            "easeInOutCirc, 0.85, 0, 0.15, 1"
            "easeOutCirc, 0, 0.55, 0.45, 1"
            "easeOutExpo, 0.16, 1, 0.3, 1"
          ];
          animation = [
            "windows, 1, 3, md3_decel, popin 60%"
            "border, 1, 10, default"
            "fade, 1, 2.5, md3_decel"
            "workspaces, 1, 3.5, easeOutExpo, slide"
            "specialWorkspace, 1, 3, md3_decel, slidevert"
          ];
        };

        dwindle.pseudotile = true;
        dwindle.preserve_split = true;

        master.new_status = "master";

        "$mod" = "SUPER";

        bind = [
          "$mod, Return, exec, foot"
          "$mod SHIFT, Return, exec, librewolf"
          "$mod, P, exec, fuzzel -I"
          "$mod, E, exec, thunar"
          "$mod, W, exec, powermenu"
          "$mod SHIFT, S, exec, grimshot copy area"
          "$mod CTRL, S, exec, ocr"
          "$mod SHIFT, C, killactive"
          "$mod SHIFT, Q, exit"

          "$mod, Down, cyclenext"
          "$mod, Up, cyclenext, prev"
          "$mod SHIFT, Down, layoutmsg, swapnext"
          "$mod SHIFT, Up, layoutmsg, swapprev"

          "$mod, Space, fullscreen, 1"
          "$mod, F, fullscreen, 0"

          "$mod, O, movewindow, mon:+1"
          "$mod, Period, focusmonitor, +1"
          "$mod, Comma, focusmonitor, -1"

          "$mod, 1, workspace, 1"
          "$mod, 2, workspace, 2"
          "$mod, 3, workspace, 3"
          "$mod, 4, workspace, 4"
          "$mod, 5, workspace, 5"
          "$mod, 6, workspace, 6"
          "$mod, 7, workspace, 7"
          "$mod, 8, workspace, 8"
          "$mod, 9, workspace, 9"
          "$mod, 0, workspace, 10"

          "$mod SHIFT, 1, movetoworkspace, 1"
          "$mod SHIFT, 2, movetoworkspace, 2"
          "$mod SHIFT, 3, movetoworkspace, 3"
          "$mod SHIFT, 4, movetoworkspace, 4"
          "$mod SHIFT, 5, movetoworkspace, 5"
          "$mod SHIFT, 6, movetoworkspace, 6"
          "$mod SHIFT, 7, movetoworkspace, 7"
          "$mod SHIFT, 8, movetoworkspace, 8"
          "$mod SHIFT, 9, movetoworkspace, 9"
          "$mod SHIFT, 0, movetoworkspace, 10"

          "$mod, mouse:274, togglefloating"
        ];

        bindm = [
          "$mod, mouse:272, movewindow"
          "$mod, mouse:273, resizewindow"
        ];

        binde = [
          "$mod, Left, resizeactive, -50 0"
          "$mod, Right, resizeactive, 50 0"
        ];
      };
    };
  };
}
