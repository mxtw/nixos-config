{ inputs, self, ... }: {
  flake.nixosConfigurations.squid = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.modules.nixos.hostSquid
    ];
  };
  flake.modules.nixos.hostSquid = { ... }: {
    imports = with self.modules.nixos; [
      inputs.sops-nix.nixosModules.sops
      inputs.lanzaboote.nixosModules.lanzaboote
      inputs.home-manager.nixosModules.home-manager

      common
      audio
      cli
      files
      fonts
      network
      secrets
      services
      virtualization
    ] ++
    [{
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        extraSpecialArgs = { inherit inputs; };
        users.max.imports = with self.modules.homeManager; [
          browsers
          dev
          foot
          home
          mail
          media
          niri
          secrets
          senpai
          services
          shell
          social
          tmux
          vim
        ];
      };
    }];

    networking.hostName = "squid";
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
  };
}
