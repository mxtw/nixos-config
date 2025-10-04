{ pkgs, ... }:
{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "Hack Nerd Font:size=15";
        pad = "5x5 center";
        font-size-adjustment = 2;
        include = "${pkgs.foot.themes}/share/foot/themes/gruvbox";
      };
      colors.alpha = 0.9;
      cursor.unfocused-style = "hollow";
    };
  };
}
