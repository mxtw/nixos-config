{ pkgs, ... }:
{
  programs.fish = {
    enable = true;
    shellAliases = {
      ls = "eza";
      ll = "eza -lah";
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
}
