{ self, ... }: {
  flake.modules.homeManager.niri = { pkgs, config, ... }: {
    imports = with self.modules.homeManager; [
      fuzzel
      gtk
      hyprlock
      kanshi
      kiti
      mako
      scripts
      waybar
      wlsunset
    ];

    home.packages = [
      pkgs.xwayland-satellite
    ];

    home.file."${config.xdg.configHome}/niri/config.kdl".source = ../configs/niri.kdl;
  };
}
