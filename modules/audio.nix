{
  flake.modules.nixos.audio = { pkgs, ... }: {
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    environment.systemPackages = [
      pkgs.pavucontrol
      pkgs.pamixer
    ];
    users.users.max.extraGroups = [
      "audio"
      "pipewire"
    ];
  };
}
