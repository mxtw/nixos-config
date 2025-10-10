{ config, lib, pkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      ./services
    ];

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";

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

  networking.firewall.allowedTCPPorts = [ 80 443 ];

  system.stateVersion = "25.05"; # Did you read the comment?
}

