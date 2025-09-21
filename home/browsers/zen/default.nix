{ pkgs, inputs, ... }:
let
  catppuccin = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "zen-browser";
    rev = "e171e2a1d94ed70f39ff0ac452aef335f8b233c9";
    sha256 = "cccLZSrUQ9wxmXnEntbQAfGDFB9gQmIM9pa9BXce1Xo=";
  };

  theme = "${catppuccin}/themes/Mocha/Lavender";

in
{
  imports = [
    inputs.zen-browser.homeModules.default
  ];

  home.file.".zen/default/chrome/zen-logo-mocha.svg" = {
    source = "${theme}/zen-logo-mocha.svg";
  };

  programs.zen-browser = {
    enable = true;
    profiles."default" = {
      id = 0;
      isDefault = true;
      userChrome = builtins.readFile "${theme}/userChrome.css";
      userContent = builtins.readFile "${theme}/userContent.css";
    };
  };
}
