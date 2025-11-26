{ pkgs, ... }:
let
  powermenu = pkgs.writeShellScriptBin "powermenu" ''
    CHOICE=$(cat <<EOF | fuzzel --dmenu
    suspend
    poweroff
    reboot
    quit
    EOF
    )

    case $CHOICE in
        suspend)
            systemctl suspend
            ;;
        poweroff)
            systemctl poweroff
            ;;
        reboot)
            systemctl reboot
            ;;
        quit)
            niri msg action quit
            ;;
    esac
  '';

  ocr = pkgs.writeShellScriptBin "ocr" ''
    #!/usr/bin/env bash
    grimshot save area - | tesseract stdin - | wl-copy
  '';

  time-notify = pkgs.writeShellScriptBin "time-notify" ''
    #!/usr/bin/env bash
    notify-send -t 5000 "$(date +%H:%M:%S)" "$(date +'%a, %x')"
  '';

  pass-fuzzel = pkgs.writeShellScriptBin "pass-fuzzel" ''
    selection=$(find "$HOME"/.password-store -type f -name '*.gpg' -printf '%P\n' | sed 's/.gpg$//g' | sort | fuzzel --width 60 --dmenu)

    if [ -n "$selection" ]; then
        pass show -c "$selection"
    fi
  '';
in
{
  home.packages = with pkgs;[
    powermenu
    ocr
    tesseract
    libnotify
    time-notify
    pass-fuzzel
  ];
}
