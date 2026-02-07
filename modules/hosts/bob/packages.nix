{ inputs, self, ... }: {
  flake.nixosConfigurations.bob = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.modules.nixos.hostBob
    ];
  };
  flake.modules.nixos.hostBob = { ... }: {
    imports = with self.modules.nixos; [
      inputs.sops-nix.nixosModules.sops
      inputs.lanzaboote.nixosModules.lanzaboote
      inputs.home-manager.nixosModules.home-manager

      common
      audio
      cli
      files
      fonts
      games
      input
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

    networking = {
      hostName = "bob";
      interfaces.enp14s0.wakeOnLan.enable = true;
      firewall.allowedUDPPorts = [ 9 ];
    };
  };
}
