{ pkgs, ... }:
let
  powermenu = pkgs.writeShellScriptBin "powermenu" ''
    CHOICE=$(cat <<EOF | fuzzel --dmenu
    suspend
    poweroff
    reboot
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
    esac
  '';

  ocr = pkgs.writeShellScriptBin "ocr" ''
    #!/usr/bin/env bash
    grimshot save area - | tesseract stdin - | wl-copy
  '';
in
{
  home.packages = with pkgs; [
    powermenu

    ocr
    tesseract
  ];
}
