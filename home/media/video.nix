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

  programs.obs-studio.enable = true;

  home.packages = with pkgs; [
    kdenlive
  ];
}
