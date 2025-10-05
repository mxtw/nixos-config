# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only

  nix.settings.trusted-users = [ "max" ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "dutch"; # Define your hostname.
  time.timeZone = "Europe/Berlin";
  users.users.max = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICOZx2ejqskuEDw9ZagBJ/srl0kZHki5VwYa2oxM/+Yi"
    ];
  };

  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
  ];

  services.openssh.enable = true;
  services.caddy.enable = true;
  networking.firewall.allowedTCPPorts = [ 80 443 ];

  services.freshrss = {
    enable = true;
    passwordFile = "/run/secrets/freshrss";
    webserver = "caddy";
    virtualHost = "dutch.macks.cloud";
    baseUrl = "https://dutch.macks.cloud";
  };
  system.stateVersion = "25.05"; # Did you read the comment?

}

