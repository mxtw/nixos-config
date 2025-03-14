{ pkgs, config, ... }:
{
  home.file."${config.xdg.configHome}/qutebrowser/catppuccin" = {
    source = pkgs.fetchFromGitHub {
      owner = "catppuccin";
      repo = "qutebrowser";
      rev = "808adc3d7d5be6fc573d6be6e9c888cb96b5d6e6";
      hash = "sha256-FmxrgpFlp+cMUdCx5HHIiLMGWML23p+pfxTKT/X0UME=";
    };
  };

  programs.qutebrowser = {
    enable = true;
    extraConfig = ''
      import catppuccin
      catppuccin.setup(c, "mocha", True)
    '';

    settings = {
      colors.webpage.preferred_color_scheme = "dark";
      colors.webpage.darkmode.enabled = true;
      auto_save.session = true;
    };
  };
}
