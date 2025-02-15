{ pkgs, lib, ... }:
let
  zipload = pkgs.buildGoModule {
    src = pkgs.fetchFromGitHub {
      owner = "mxtw";
      repo = "zipload";
      rev = "0fd75dcaeaee7ed971de6a52a53a19f7f11953d3";
      sha256 = "jE09qpcq+TsbnAo/SwEMK8HiA2/uSYadyyQZ3Gv0gNQ=";
    };
    name = "zipload";
    vendorHash = "sha256-3lgpC5jWgDpLi3zDXI+Kk+Qo1AC0pDY86BvBc4T3Kg0=";
  };
in
{
  home.packages = with pkgs; [
    ncdu
    unzip
    jq
    zipload
  ];

  programs.fastfetch.enable = true;

  programs.ripgrep.enable = true;

  programs.tealdeer.enable = true;
  programs.tealdeer.settings.updates.auto_update = true;

  programs.btop = {
    enable = true;
    settings.theme_background = false;
    settings.color_theme = "TTY";
  };
}
