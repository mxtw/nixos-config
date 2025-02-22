{ pkgs, ... }:

let
  rose-pine-fish = pkgs.fetchFromGitHub {
    owner = "rose-pine";
    repo = "fish";
    rev = "38aab5baabefea1bc7e560ba3fbdb53cb91a6186";
    sha256 = "bSGGksL/jBNqVV0cHZ8eJ03/8j3HfD9HXpDa8G/Cmi8=";
  };
in
{

  xdg.configFile."fish/themes/Rosé Pine.theme".source = "${rose-pine-fish}/themes/Rosé Pine.theme";

  programs.fish = {
    enable = true;
    shellAliases = {
      ls = "eza";
      ll = "eza --git -lah";
      vim = "nvim";
    };
    shellAbbrs = {
      lg = "lazygit";

      dc = "docker compose";
    };
    plugins = [
      {
        name = "bang-bang";
        src = pkgs.fishPlugins.bang-bang.src;
      }
      {
        name = "tide";
        src = pkgs.fishPlugins.tide.src;
      }
      {
        name = "fzf-fish";
        src = pkgs.fishPlugins.fzf-fish.src;
      }
    ];
    interactiveShellInit = ''
      set -U fish_greeting ""
      fish_config theme choose "Rosé Pine"
    '';
    functions = {
      initflake = ''nix flake init --template "https://flakehub.com/f/the-nix-way/dev-templates/*#$argv"'';
    };

  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
    options = [
      "--cmd cd"
    ];
  };

  programs.eza = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
    colors = {
      "bg+" = "#26233a";
      "fg+" = "#e0def4";
      "header" = "#31748f";
      "hl+" = "#ebbcba";
      "hl" = "#ebbcba";
      "info" = "#9ccfd8";
      "marker" = "#eb6f92";
      "pointer" = "#c4a7e7";
      "prompt" = "#908caa";
      "spinner" = "#f6c177";
    };
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.nix-index = {
    enable = true;
    enableFishIntegration = true;
  };
}
