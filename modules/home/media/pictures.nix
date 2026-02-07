{
  flake.modules.homeManager.pictures = { pkgs, ... }: {
    programs.feh.enable = true;

    home.packages = with pkgs; [
      krita
      kdePackages.kolourpaint
      pandoc
      imagemagick
      sway-contrib.grimshot
      slurp
    ];
  };
}
