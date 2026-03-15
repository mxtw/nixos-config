{
  flake.modules.homeManager.video = { pkgs, ... }: {
    programs.mpv = {
      enable = true;
      config = {
        vo = "gpu";
        hwdec = "vaapi";
        keep-open = true;
        fullscreen = true;
        volume = 100;
        ytdl-format = "bestvideo+bestaudio";
        ytdl-raw-options-append = [
          "cookies-from-browser=chromium:~/.local/share/qutebrowser"
          "mark-watched="
        ];
        demuxer-max-bytes = "1GiB";
      };
    };

    programs.obs-studio = {
      enable = true;
      plugins = with pkgs.obs-studio-plugins; [
        wlrobs
        obs-vaapi
      ];
    };

    home.packages = [
      pkgs.kdePackages.kdenlive
      pkgs.ffmpeg
      pkgs.yt-dlp
    ];
  };
}
