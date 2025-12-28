{ pkgs, ... }:
{
  home.packages = with pkgs; [
    spotify
    strawberry
  ];

  services.mopidy = {
    enable = true;
    settings = {
      file = {
        media_dirs = [ "~/Music|Music" ];
      };
      local = {
        media_dir = "~/Music";
      };
    };
    extensionPackages = with pkgs; [
      mopidy-mpd
      mopidy-local
    ];
  };
  programs.ncmpcpp = {
    enable = true;
    mpdMusicDir = "~/Music";
  };
}
