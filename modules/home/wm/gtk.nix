{
  flake.modules.homeManager.gtk = { pkgs, config, ... }: {
    gtk = {
      enable = true;
      theme.name = "Catppuccin-GTK-Dark";
      theme.package = pkgs.magnetic-catppuccin-gtk;
      iconTheme.name = "Papirus";
      iconTheme.package = pkgs.papirus-icon-theme;
      cursorTheme.name = "catppuccin-mocha-dark-cursors";
      cursorTheme.package = pkgs.catppuccin-cursors.mochaDark;
      cursorTheme.size = 16;
      gtk4.theme = config.gtk.theme;
    };
  };
}
