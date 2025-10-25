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
      set print_command "nix-search-tv print"
      set preview_command "nix-search-tv preview {}"
      set result (nix-search-tv print | fzf --preview "$preview_command" \
                                --preview-window=up \
                                --scheme history \
                                --header '^a all ^n nixos ^p nixpkgs ^m home-manager ^v nixvim'\
                                --prompt "all: " \
                                --bind "ctrl-a:change-prompt(all: )+reload($print_command)+change-preview($preview_command)" \
                                --bind "ctrl-n:change-prompt(nixos: )+reload($print_command --indexes nixos)+change-preview($preview_command --indexes nixos)" \
                                --bind "ctrl-p:change-prompt(nixpkgs: )+reload($print_command --indexes nixpkgs)+change-preview($preview_command --indexes nixpkgs)" \
                                --bind "ctrl-m:change-prompt(home-manager: )+reload($print_command --indexes home-manager)+change-preview($preview_command --indexes home-manager)" \
                                --bind "ctrl-v:change-prompt(nixvim: )+reload($print_command --indexes nixvim)+change-preview($preview_command --indexes nixvim)")

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
