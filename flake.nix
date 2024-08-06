{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs?ref=nixos-24.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs?ref=nixos-unstable";
    home-manager.url = "github:nix-community/home-manager?ref=release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }@inputs:
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

	    home-manager.nixosModules.home-manager {
		home-manager = {
		  useGlobalPkgs = true;
		  useUserPackages = true;
		  users.max = {...}: {
		    	imports = [ ./home/home.nix ];
		  };
		};
	    }

            ./packages/cli/default.nix
            ./packages/fonts/default.nix
            ./packages/terminal/default.nix
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
