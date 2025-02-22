{ pkgs, ... }:
{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "Hack Nerd Font:size=18";
        pad = "5x5 center";
        font-size-adjustment = 2;
        include = "${pkgs.foot.themes}/share/foot/themes/rose-pine";
      };
      colors.alpha = 0.9;
      # cursor.color = "1e1e2e cdd6f4";
      cursor.unfocused-style = "hollow";
    };
  };
}
