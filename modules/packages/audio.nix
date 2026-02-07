{
  flake.modules.nixos.audio = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.pavucontrol
      pkgs.pamixer
    ];
  };
}
