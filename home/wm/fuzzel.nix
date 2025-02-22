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
          background = "191724da";
          text = "e0def4ff";
          input = "e0def4ff";
          prompt = "e0def4ff";
          match = "ebbcbaff";
          selection = "6e6a86ff";
          selection-match = "ebbcbaff";
          selection-text = "e0def4ff";
          border = "ebbcbaff";
        };
      };
    };
  };
}
