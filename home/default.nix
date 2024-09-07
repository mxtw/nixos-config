{ config, pkgs, ... }:

let
  river = import ./river {
    inherit config pkgs;
  };
in
{
  home.username = "max";
  home.homeDirectory = "/home/max";

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;

  imports = [
    river
  ];

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
