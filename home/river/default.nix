let
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
  wayland.windowManager.river = {
    enable = true;
    systemd.enable = true;
    extraConfig = ''
      rivertile -view-padding 2 -outer-padding 0 &
    '';
    settings = {

      default-layout = "rivertile";
      spawn = [
        "yambar"
      ];

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
}
