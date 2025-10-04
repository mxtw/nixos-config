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
          font = "Hack Nerd Font:size=18";
          horizontal-pad = 5;
          vertical-pad = 5;
          dpi-aware = false;
        };
        border = {
          width = 2;
          radius = 0;
        };
        colors = {
          background = "282828da";
          text = "ebdbb2ff";
          input = "ebdbb2ff";
          prompt = "ebdbb2ff";
          match = "b8bb26ff";
          selection = "928374ff";
          selection-match = "b8bb26ff";
          selection-text = "ebdbb2ff";
          border = "b8bb26ff";
        };
      };
    };
  };
}
