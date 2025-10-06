{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs?ref=nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
    lanzaboote.url = "github:nix-community/lanzaboote/v0.4.2";
    lanzaboote.inputs.nixpkgs.follows = "nixpkgs";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    zen-browser.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, nixvim, lanzaboote, zen-browser, ... }@inputs:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";

      # see https://github.com/jackdbd/nix-config/blob/451f47e3c5040c3e5fb6cf07b328bec0655b1ccd/flake.nix#L56-L74 
      # for inspiration
      allowed-unfree-packages = [
        "steam"
        "steam-unwrapped"
        "spotify"
        "obsidian"
      ];

      mkSystem = pkgs: system: hostname:
        pkgs.lib.nixosSystem {
          system = system;
          modules = [
            { networking.hostName = hostname; }
            ./hosts/configuration.nix
            (./. + "/hosts/${hostname}/hardware-configuration.nix")
            ./hosts/${hostname}/packages.nix

            lanzaboote.nixosModules.lanzaboote
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = { inherit inputs; };
                users.max = { ... }: {
                  imports = [ ./hosts/${hostname}/user.nix ];
                };
              };
            }

          ];
          specialArgs = {
            inherit allowed-unfree-packages inputs;
          };
        };

    in
    {
      nixosConfigurations = {
        bob = mkSystem inputs.nixpkgs "x86_64-linux" "bob";
        pat = mkSystem inputs.nixpkgs "x86_64-linux" "pat";
        squid = mkSystem inputs.nixpkgs "x86_64-linux" "squid";
      };
    };
}
