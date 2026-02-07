{ inputs, self, ... }: {
  flake.nixosConfigurations.pat = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.modules.nixos.hostPat
    ];
  };
  flake.modules.nixos.hostPat = { ... }: {
    networking.hostName = "pat";

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
