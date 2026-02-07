{
  flake.modules.homeManager.video = { pkgs, ... }:
    let
      # temporary workaround to make the build work again, see
      # https://github.com/NixOS/nixpkgs/issues/483540#issuecomment-3839811537
      kdenlive-ffmpeg7 = pkgs.kdePackages.kdenlive.override {
        ffmpeg-full = pkgs.ffmpeg_7-full;
      };
    in
    {
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
        kdenlive-ffmpeg7
        pkgs.ffmpeg
        pkgs.yt-dlp
      ];
    };
}
