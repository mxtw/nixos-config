{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ncdu
    unzip
    jq
    fd
    hcloud
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
