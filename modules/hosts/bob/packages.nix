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

    networking = {
      hostName = "bob";
      interfaces.enp14s0.wakeOnLan.enable = true;
      firewall.allowedUDPPorts = [ 9 ];
    };
  };
}
