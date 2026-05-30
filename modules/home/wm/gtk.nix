{
  flake.modules.homeManager.gtk = { pkgs, config, ... }: {
    gtk = {
      enable = true;
      theme.name = "Gruvbox-Dark";
      theme.package = pkgs.gruvbox-gtk-theme;
      iconTheme.name = "Gruvbox-Plus-Dark";
      iconTheme.package = pkgs.gruvbox-plus-icons;
      cursorTheme.name = "Bibata-Original-Amber";
      cursorTheme.package = pkgs.bibata-cursors;
      cursorTheme.size = 24;
      gtk4.theme = config.gtk.theme;
    };
  };
}
