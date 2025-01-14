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
}
