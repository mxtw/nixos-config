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
in
{
  home.packages = with pkgs; [
    powermenu
  ];
}
