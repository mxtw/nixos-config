{ inputs, self, ... }: {
  flake.nixosConfigurations.dutch = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.modules.nixos.hostDutch
    ];
  };
  flake.modules.nixos.hostDutch = { pkgs, ... }: {
    imports = with self.modules.nixos; [
      inputs.sops-nix.nixosModules.sops

      cgit
      freshrss
      irc
      linkding
      nginx
      ntfy
      taskchampion
      teamspeak-server
      uptime
      prosody

      ssh
      user
    ];

    boot.loader.grub.enable = true;
    boot.loader.grub.device = "/dev/sda";

    nix.settings.trusted-users = [ "max" ];
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    networking.hostName = "dutch"; # Define your hostname.
    time.timeZone = "Europe/Berlin";

    sops.defaultSopsFile = ./secrets.yaml;
    sops.age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];

    programs.nh = {
      enable = true;
      clean.enable = true;
    };

    environment.systemPackages = with pkgs;[
      vim
      lnav
      htop
      git
    ];

    system.stateVersion = "25.05"; # Did you read the comment?
  };
}
