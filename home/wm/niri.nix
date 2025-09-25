{ pkgs, config, ... }:
{
  home.packages = [
    pkgs.xwayland-satellite
  ];

  home.file."${config.xdg.configHome}/niri/config.kdl".text = ''
    prefer-no-csd
    spawn-at-startup "kiti"

    input {
        keyboard {
            xkb {
                layout "eu,us"
                options ",caps:ctrl_modifier"
                variant ",colemak_dh"
            }
            repeat-rate 50
            repeat-delay 300
        }
        mouse {
            accel-profile "flat"
        }
        touchpad {
            tap
            natural-scroll
            disabled-on-external-mouse
        }
        trackpoint {
            accel-profile "adaptive"
            accel-speed -0.5
        }
    }

    output "eDP-1" {
        scale 1.0
    }

    output "DP-1" {
        scale 1.0
        mode "2560x1440@170"
        position x=0 y=0
        focus-at-startup
    }
    output "DP-2" {
        scale 1.0
        mode "1920x1080@144.001"
        position x=2560 y=360
    }

    layout {
        gaps 2
        always-center-single-column

        focus-ring {
            off
        }
        border {
            width 2
            active-color "#b4befe"
            urgent-color "#f9e2af"
            inactive-color "#1e1e2e"
        }
        tab-indicator {
            place-within-column
            width 4
            gap 0
            position "top"
            length total-proportion=1.0
        }
    }

    cursor {
        xcursor-theme "catppuccin-mocha-dark-cursors"
        xcursor-size 16
    }

    overview {
        backdrop-color "#1e1e2e"
    }

    binds {
        Mod+Shift+Slash { show-hotkey-overlay; }

        Mod+Return hotkey-overlay-title="Open Terminal" { spawn "foot"; }
        Mod+Shift+Return hotkey-overlay-title="Open Browser" { spawn "librewolf"; }
        Mod+Ctrl+Return hotkey-overlay-title="Open Browser (Private Window)" { spawn-sh "librewolf --private-window"; }
        Mod+E hotkey-overlay-title="Open Filemanager" { spawn "thunar"; }
        Mod+P hotkey-overlay-title="Open Launcher" { spawn "fuzzel"; }
        Mod+Shift+S hotkey-overlay-title="Take Screenshot" { spawn-sh "grimshot copy area"; }
        Mod+Z hotkey-overlay-title="Zoom" { spawn "wooz"; }
        Mod+Shift+T hotkey-overlay-title="Show Time" { spawn "time-notify"; }

        Mod+W repeat=false { toggle-overview; }
        Mod+Shift+C repeat=false { close-window; }
        Mod+Shift+Q repeat=false hotkey-overlay-title="Open Powermenu" { spawn "powermenu"; }
        Mod+L { spawn "hyprlock"; }

        Mod+Left { focus-column-left; }
        Mod+Right { focus-column-right; }
        Mod+Down { focus-window-down; }
        Mod+Up { focus-window-up; }

        Mod+Ctrl+Left { move-column-left; }
        Mod+Ctrl+Right { move-column-right; }
        Mod+Ctrl+Down { move-window-down; }
        Mod+Ctrl+Up { move-window-up; }

        Mod+Shift+Left { set-window-width "-10%"; }
        Mod+Shift+Right { set-window-width "+10%"; }
        Mod+Shift+Down { set-window-height "-10%"; }
        Mod+Shift+Up { set-window-height "+10%"; }

        Mod+Shift+K { consume-or-expel-window-left; }
        Mod+Shift+H { consume-or-expel-window-right; }
        Mod+T { toggle-column-tabbed-display; }
        Mod+R { switch-preset-column-width; }

        Mod+1 { focus-workspace 1; }
        Mod+2 { focus-workspace 2; }
        Mod+3 { focus-workspace 3; }
        Mod+4 { focus-workspace 4; }
        Mod+5 { focus-workspace 5; }
        Mod+6 { focus-workspace 6; }
        Mod+7 { focus-workspace 7; }
        Mod+8 { focus-workspace 8; }
        Mod+9 { focus-workspace 9; }
        Mod+Shift+1 { move-column-to-workspace 1; }
        Mod+Shift+2 { move-column-to-workspace 2; }
        Mod+Shift+3 { move-column-to-workspace 3; }
        Mod+Shift+4 { move-column-to-workspace 4; }
        Mod+Shift+5 { move-column-to-workspace 5; }
        Mod+Shift+6 { move-column-to-workspace 6; }
        Mod+Shift+7 { move-column-to-workspace 7; }
        Mod+Shift+8 { move-column-to-workspace 8; }
        Mod+Shift+9 { move-column-to-workspace 9; }

        Mod+U { focus-workspace-up; }
        Mod+D { focus-workspace-down; }
        Mod+Shift+U { move-column-to-workspace-up; }
        Mod+Shift+D { move-column-to-workspace-down; }
        Mod+Ctrl+U { move-workspace-up; }
        Mod+Ctrl+D { move-workspace-down; }

        Mod+Space { maximize-column; }
        Mod+Shift+Space { expand-column-to-available-width; }
        Mod+F { fullscreen-window; }
        Mod+C { center-visible-columns; }

        Mod+Shift+L hotkey-overlay-title="Switch Keyboard Layout" { switch-layout "next"; }

        Mod+Period { focus-monitor-next; }
        Mod+Comma { focus-monitor-previous; }
        Mod+O { move-column-to-monitor-next; }
        Mod+Shift+O { move-workspace-to-monitor-next; }
        Mod+Tab { switch-focus-between-floating-and-tiling; }
        Mod+V { toggle-window-floating; }

        Mod+MouseMiddle { toggle-window-floating; }
        Mod+WheelScrollRight cooldown-ms=100 { focus-column-right; }
        Mod+WheelScrollLeft  cooldown-ms=100 { focus-column-left; }

        XF86AudioMute { spawn-sh "pamixer --toggle-mute"; }
        XF86AudioMicMute { spawn-sh "pamixer --toggle-mute --default-source"; }
        XF86AudioLowerVolume { spawn-sh "pamixer --decrease 5"; }
        XF86AudioRaiseVolume { spawn-sh "pamixer --increase 5"; }
        XF86MonBrightnessDown { spawn-sh "brightnessctl set 10%-"; }
        XF86MonBrightnessUp { spawn-sh "brightnessctl set +10%"; }
    }
  '';
}
