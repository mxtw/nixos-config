{ self, ... }: {
  flake.modules.homeManager.media = {
    imports = with self.modules.homeManager; [
      music
      news
      pdf
      pictures
      radio
      video
    ];
  };

}
