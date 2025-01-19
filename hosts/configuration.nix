{ config, pkgs, ... }:

{
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    tmp.cleanOnBoot = true;
    kernelPackages = pkgs.linuxPackages_latest;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.trusted-users = [ "max" ];

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Berlin";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PasswordAuthentication = true;
      AllowUsers = null;
      UseDns = true;
      X11Forwarding = false;
      PermitRootLogin = "prohibit-password";
    };
  };

  security.pam.services.max.enableGnomeKeyring = true;
  services.gnome.gnome-keyring.enable = true;

  # needed for river to work
  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;

  environment.systemPackages = [
    (pkgs.catppuccin-sddm.override {
      flavor = "mocha";
    })
  ];
  services.displayManager = {
    sddm = {
      enable = true;
      wayland.enable = true;
      theme = "catppuccin-mocha";
      package = pkgs.kdePackages.sddm;
    };
    defaultSession = "river";
  };
  services.dbus.enable = true;
  programs.river.enable = true;

  # bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

  security.rtkit.enable = true;
  # audio
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

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
  };

  users.users.max = {
    isNormalUser = true;
    description = "max";
    extraGroups = [ "networkmanager" "wheel" "pipewire" "audio" "video" ];
    shell = pkgs.fish;
  };

  nixpkgs.config.allowUnfree = true;

  programs.fish.enable = true;
  system.stateVersion = "24.05"; # Did you read the comment?

}
