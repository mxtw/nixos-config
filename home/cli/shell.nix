{ pkgs, ... }:

let
  catppuccin-fish = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "fish";
    rev = "cc8e4d8fffbdaab07b3979131030b234596f18da";
    sha256 = "udiU2TOh0lYL7K7ylbt+BGlSDgCjMpy75vQ98C1kFcc=";
  };
in
{

  xdg.configFile."fish/themes/Catppuccin Mocha.theme".source = "${catppuccin-fish}/themes/Catppuccin Mocha.theme";

  programs.fish = {
    enable = true;
    shellAliases = {
      ls = "eza";
      ll = "eza --git -lah";
      vim = "nvim";
    };
    shellAbbrs = {
      lg = "lazygit";
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
      set -U fish_color_scheme "Catppuccin Mocha"
      set -U fish_greeting ""
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
      "bg+" = "#313244";
      "fg" = "#cdd6f4";
      "fg+" = "#cdd6f4";
      "header" = "#f38ba8";
      "hl" = "#f38ba8";
      "hl+" = "#f38ba8";
      "info" = "#cba6f7";
      "marker" = "#b4befe";
      "pointer" = "#f5e0dc";
      "prompt" = "#cba6f7";
      "selected-bg" = "#45475a";
      "spinner" = "#f5e0dc";
    };
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
