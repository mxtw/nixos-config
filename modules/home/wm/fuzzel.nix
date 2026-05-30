{
  flake.modules.homeManager.fuzzel = {
    programs.fuzzel = {
      enable = true;
      settings = {
        main = {
          font = "IosevkaTerm Nerd Font:size=18";
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
          match = "83a598ff";
          selection = "ebdbb25f";
          selection-match = "83a598ff";
          selection-text = "ebdbb2ff";
          border = "ebdbb2ff";
        };
      };
    };
  };
}
