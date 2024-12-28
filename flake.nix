{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs?ref=nixos-unstable";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs?ref=nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, nixvim, ... }@inputs:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";

      mkSystem = pkgs: system: hostname:
        pkgs.lib.nixosSystem {
          system = system;
          modules = [
            { networking.hostName = hostname; }
            ./hosts/configuration.nix
            (./. + "/hosts/${hostname}/hardware-configuration.nix")

            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = { inherit inputs; };
                users.max = { ... }: {
                  imports = [ ./home ];
                };
              };
            }

            ./packages/cli/default.nix
            ./packages/fonts/default.nix
            ./packages/terminal/default.nix
            ./packages/secrets/default.nix
            ./packages/browsers/default.nix
          ];
          specialArgs = {
            unstable = import nixpkgs-unstable { inherit system; };
            inherit inputs;
          };
        };

    in
    {
      nixosConfigurations = {
        nix-vm = mkSystem inputs.nixpkgs "x86_64-linux" "nix-vm";
        nixpad = mkSystem inputs.nixpkgs "x86_64-linux" "nixpad";
      };
    };
}
