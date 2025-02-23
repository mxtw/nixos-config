{ lib, config, ... }:

with lib;
let cfg = config.modules.fuzzel;

in {
  options.modules.fuzzel = { enable = mkEnableOption "foot"; };

  config = mkIf cfg.enable {
    programs.fuzzel = {
      enable = true;
      settings = {
        main = {
          font = "Iosevka Nerd Font:size=15";
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
          input = "cdd6f4ff";
          prompt = "cdd6f4ff";
          match = "b4befeff";
          selection = "585b70ff";
          selection-match = "b4befeff";
          selection-text = "cdd6f4ff";
          border = "b4befeff";
        };
      };
    };
  };
}
