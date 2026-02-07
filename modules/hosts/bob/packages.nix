{ inputs, self, ... }: {
  flake.nixosConfigurations.bob = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.modules.nixos.hostBob
    ];
  };
  flake.modules.nixos.hostBob = { ... }: {
    networking = {
      hostName = "bob";
      interfaces.enp14s0.wakeOnLan.enable = true;
      firewall.allowedUDPPorts = [ 9 ];
    };

    imports = with self.modules.nixos; [
      inputs.sops-nix.nixosModules.sops
      inputs.lanzaboote.nixosModules.lanzaboote
      inputs.home-manager.nixosModules.home-manager

      audio
      auto-cpufreq
      common
      graphics
      printing

      cli
      files
      fonts
      games
      secrets
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
  };
}
