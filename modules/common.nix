{ self, ... }: {
  flake.modules.nixos.common = {
    imports = with self.modules.nixos; [
      boot
      ssh
      networking
      locale
      security
      unfree
      user
    ];

    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    nix.settings.trusted-users = [ "max" ];

    system.stateVersion = "24.05"; # Did you read the comment?
  };
}
