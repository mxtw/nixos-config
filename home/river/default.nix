{ lib, config, ...}:

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
  wayland.windowManager.river = {
    enable = true;
    systemd.enable = false;
    extraConfig = ''
      rivertile -view-padding 2 -outer-padding 0 &
    '';
    settings = {

      default-layout = "rivertile";
      spawn = [
        "yambar"
      ];

      keyboard-layout = if cfg.colemak 
        then
          "-options ctrl:swapcaps -variant colemak_dh us"
        else
          "eu";

      input."pointer-2-7-*" = {
        accel-profile = "adaptive";
        natural-scroll = "enabled";
        tap = "enabled";
      };

      set-repeat = "50 300";

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

              { name = "Super+Shift C"; value = "close"; }
              { name = "Super+Shift Q"; value = "exit"; }

              { name = "Super Down"; value = "focus-view next"; }
              { name = "Super Up"; value = "focus-view previous"; }
              { name = "Super+Shift Down"; value = "swap next"; }
              { name = "Super+Shift Up"; value = "swap previous"; }
            ] ++
            # Other tag-related keybindings (toggle-focused, set-view, etc.)
            (keyBindingsForTags { keyPrefix = "Super"; command = "set-focused-tags"; }) ++
            (keyBindingsForTags { keyPrefix = "Super+Control"; command = "toggle-focused-tags"; }) ++
            (keyBindingsForTags { keyPrefix = "Super+Shift"; command = "set-view-tags"; }) ++
            (keyBindingsForTags { keyPrefix = "Super+Shift+Control"; command = "toggle-view-tags"; })
          );
      };
    };
  };
};
}
