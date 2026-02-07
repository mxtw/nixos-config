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
          bat
          browsers
          dev
          firefox
          fuzzel
          git
          home
          hyprlock
          kanshi
          kiti
          kubernetes
          mail
          mako
          misc
          music
          news
          niri
          nix
          pdf
          pictures
          qutebrowser
          radio
          river
          scripts
          secrets
          senpai
          services
          shell
          social
          terminal
          tmux
          todo
          video
          vim
          waybar
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
