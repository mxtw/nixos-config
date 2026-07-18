{
  flake.modules.homeManager.gtk = { pkgs, config, ... }: {
    gtk = {
      enable = true;
      theme.name = "Catppuccin-GTK-Dark";
      theme.package = pkgs.magnetic-catppuccin-gtk;
      iconTheme.name = "Papirus";
      iconTheme.package = pkgs.papirus-icon-theme;
      cursorTheme.name = "catppuccin-mocha-lavender-cursors";
      cursorTheme.package = pkgs.catppuccin-cursors.mochaLavender;
      cursorTheme.size = 24;
      gtk4.theme = config.gtk.theme;
    };
  };
}
