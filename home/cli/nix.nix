{ pkgs, inputs, ... }:
{
  programs = {
    nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 4d --keep 3";
      flake = "/home/max/code/nixos-config";
    };

    nix-search-tv = {
      enable = true;
      settings = {
        indexes = [ "nixos" "nixpkgs" "home-manager" ];
        experimental.options_file = {
          nixvim = inputs.nixvim.packages.${pkgs.system}.options-json + "/share/doc/nixos/options.json";
        };
      };
    };
    fish.functions.ns = ''
      set result (nix-search-tv print | fzf --preview='nix-search-tv preview {}')
      if [ "$result" ]
          nix-search-tv preview "$result"
      end
    '';

    nix-index = {
      enable = true;
      enableFishIntegration = true;
    };
  };
}
