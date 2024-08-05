{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs?ref=nixos-24.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, ... }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
    in
    {
      nixosConfigurations = {
        nix-vm = lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/nix-vm/configuration.nix
            ./packages/cli/default.nix
            ./packages/fonts/default.nix
            ./packages/terminal/default.nix
            ./packages/browsers/default.nix
          ];

          specialArgs = {
            unstablePkgs = import nixpkgs-unstable { inherit system; };
          };
        };
      };
    };
}
