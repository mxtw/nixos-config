{
  imports = [
    ../../packages/audio.nix
    ../../packages/browsers.nix
    ../../packages/cli.nix
    ../../packages/files.nix
    ../../packages/fonts.nix
    ../../packages/input.nix
    ../../packages/network.nix
    ../../packages/secrets.nix
    ../../packages/services.nix
    ../../packages/virtualization.nix
  ];

  services.auto-cpufreq = {
    enable = true;
    settings = {
      battery = {
        governor = "powersave";
        turbo = "never";
      };
      charger = {
        governor = "performance";
        turbo = "auto";
      };
    };
  };
}
