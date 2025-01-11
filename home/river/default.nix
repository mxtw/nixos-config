{ lib, config, pkgs, ... }:

with lib;
let
  cfg = config.modules.river;

  tagValues = [ 4294967296 1 2 4 8 16 32 64 128 256 ];

  # Function to generate key bindings for tags
  keyBindingsForTags = { keyPrefix, command }:
    map
      (i: {
        name = "${keyPrefix} ${toString i}";
        value = "${command} ${toString (builtins.elemAt tagValues (i))}";
      }) [ 0 1 2 3 4 5 6 7 8 9 ];
in
{
  options.modules.river = {
    enable = mkEnableOption "river";
    colemak = mkEnableOption "river";
  };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.rivercarro ];

    wayland.windowManager.river = {
      enable = true;
      systemd.enable = true;
      xwayland.enable = true;
      extraConfig = ''
        rivercarro -inner-gaps 2 -outer-gaps 2 -no-smart-gaps -per-tag &
      '';
      settings = {

        default-layout = "rivercarro";
        spawn = [
          "${config.xdg.configHome}/yambar/launch.sh"
        ];

        keyboard-layout =
          if cfg.colemak
          then
            "-options ctrl:swapcaps -variant colemak_dh us"
          else
            "eu";

        input."pointer-2-7-*" = {
          accel-profile = "adaptive";
          natural-scroll = "enabled";
          tap = "enabled";
        };

        input."pointer-*".accel-profile = "flat";

        set-repeat = "50 300";
        set-cursor-warp = "on-output-change";

        background-color = "0x1e1e2e";
        border-color-focused = "0xb4befe";
        border-color-unfocused = "0x1e1e2ee6";
        rule-add = "-app-id '*' ssd"; # server side decoration for every app


        map = {
          normal = builtins.listToAttrs
            (
              [
                { name = "Super Return"; value = "spawn foot"; }
                { name = "Super+Shift Return"; value = "spawn librewolf"; }
                { name = "Super P"; value = "spawn 'fuzzel -I'"; }
                { name = "Super E"; value = "spawn thunar"; }

                { name = "Super+Shift C"; value = "close"; }
                { name = "Super+Shift Q"; value = "exit"; }

                { name = "Super Down"; value = "focus-view next"; }
                { name = "Super Up"; value = "focus-view previous"; }
                { name = "Super+Shift Down"; value = "swap next"; }
                { name = "Super+Shift Up"; value = "swap previous"; }

                { name = "Super Period"; value = "focus-output next"; }
                { name = "Super Comma"; value = "focus-output previous"; }
                { name = "Super Period"; value = "focus-output next"; }
                { name = "Super Comma"; value = "focus-output previous"; }

                { name = "Super+Shift Period"; value = "send-to-output -current-tags next"; }
                { name = "Super+Shift Comma"; value = "send-to-output -current-tags previous"; }
                {
                  name = "Super O";
                  value = "spawn 'sh -c \"riverctl send-to-output -current-tags next && riverctl focus-output next\"'";
                }

                { name = "Super M"; value = "zoom"; }
                { name = "Super Left"; value = "send-layout-cmd rivercarro 'main-ratio -0.05'"; }
                { name = "Super Right"; value = "send-layout-cmd rivercarro 'main-ratio +0.05'"; }
                { name = "Super+Shift Left"; value = "send-layout-cmd rivercarro 'main-count +1'"; }
                { name = "Super+Shift Right"; value = "send-layout-cmd rivercarro 'main-ratio -1'"; }

                { name = "Super Space"; value = "send-layout-cmd rivercarro 'main-location-cycle left,monocle'"; }
                { name = "Super F"; value = "toggle-fullscreen"; }
              ] ++
              # Other tag-related keybindings (toggle-focused, set-view, etc.)
              (keyBindingsForTags {
                keyPrefix = "Super";
                command = "set-focused-tags";
              }) ++
              (keyBindingsForTags {
                keyPrefix = "Super+Control";
                command = "toggle-focused-tags";
              }) ++
              (keyBindingsForTags {
                keyPrefix = "Super+Shift";
                command = "set-view-tags";
              }) ++
              (keyBindingsForTags {
                keyPrefix = "Super+Shift+Control";
                command = "toggle-view-tags";
              })
            );
        };
      };
    };
  };
}

