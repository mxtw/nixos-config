{
  flake.modules.nixos.graphics = { pkgs, ... }: {
    hardware.graphics.enable = true;
    hardware.graphics.enable32Bit = true;

    environment.systemPackages = [
      (pkgs.catppuccin-sddm.override {
        flavor = "mocha";
        accent = "lavender";
      })
    ];
    services.displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
        theme = "catppuccin-mocha-lavender";
        package = pkgs.kdePackages.sddm;
      };
      defaultSession = "niri";
    };
    services.dbus.enable = true;
    programs.niri.enable = true;

    # needed for gtk
    programs.dconf.enable = true;

    xdg.portal = {
      enable = true;
      wlr = {
        enable = true;
        settings.screencast = {
          chooser_type = "simple";
          chooser_cmd = "${pkgs.slurp}/bin/slurp -f %o -ro";
        };
      };
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
        xdg-desktop-portal
      ];
      config = {
        niri = {
          default = [ "gnome;gtk" ];
        };
      };
    };

    users.users.max.extraGroups = [
      "video"
    ];
  };
}
