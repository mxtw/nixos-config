{ pkgs, ... }:
{
  programs.mpv = {
    enable = true;
    config = {
      vo = "gpu";
      hwdec = "vaapi";
      keep-open = true;
      fullscreen = true;
      volume = 100;
    };
  };

  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-vaapi
    ];
  };

  home.packages = with pkgs; [
    kdePackages.kdenlive
  ];
}
