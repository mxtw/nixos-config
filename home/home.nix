{ config, pkgs, ... }:

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
  home.username = "max";
  home.homeDirectory = "/home/max";

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;

  programs.lazygit.enable = true;

  programs.neovim = {
    enable = true;
    vimAlias = true;
    defaultEditor = true;
  };

  programs.librewolf = {
    enable = true;
  };

  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "Hack Nerd Font:size=18";
        horizontal-pad = 5;
        vertical-pad = 5;
      };
      border = {
        width = 2;
        radius = 0;
      };
      colors = {
        background = "1e1e2eda";
        text = "cdd6f4ff";
        match = "b4befeff";
        selection = "585b70ff";
        selection-match = "b4befeff";
        selection-text = "cdd6f4ff";
        border = "b4befeff";
      };
    };
  };

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

  programs.yambar = {
    enable = true;
    settings = {
      bar = {
        background = "1e1e2ee6";
        foreground = "b4befeff";
        location = "top";
        font = "hack nerd font";
        height = 20;
      };

      clock = {
        time-format = "%H:%M";
        date-format = "%Y-%m-%d";
        content.string = {
          text = "{date} {time}";
          foreground = "f38ba8ff";
        };
      };
    };
  };

  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "Hack Nerd Font:size=18";
        pad = "5x5 center";
        font-size-adjustment = 2;
        include = "/usr/share/foot/themes/catppuccin-mocha";
      };
    };
  };



}
