{
  flake.modules.homeManager.foot = { pkgs, ... }: {
    programs.foot = {
      enable = true;
      settings = {
        main = {
          font = "IosevkaTerm Nerd Font:size=15";
          pad = "5x2 center";
          font-size-adjustment = 2;
          include = "${pkgs.foot.themes}/share/foot/themes/gruvbox";
        };
        colors-dark.alpha = 0.95;
        cursor.unfocused-style = "hollow";
      };
    };
  };
}
