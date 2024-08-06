{ config, pkgs, ... }:

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

  wayland.windowManager.river = {
    enable = true;
    systemd.enable = true;
    extraConfig = ''
      rivertile -view-padding 2 -outer-padding 0 &
    '';
    settings = {
      spawn = [
        "yambar"
        "foot"
      ];

      map = {
        normal = {
          "Super Return" = "spawn foot";
          "Super+Shift Return" = "librewolf";
          "Super P" = "spawn fuzzel -I";

          "Super+Shift C" = "close";
          "Super+Shift Q" = "exit";

          "Super Down" = "focus-view next";
          "Super Up" = "focus-view previous";
          "Super+Shift Down" = "swap next";
          "Super+Shift Up" = "swap previous";
        };
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
