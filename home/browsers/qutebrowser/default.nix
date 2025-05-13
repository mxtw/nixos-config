{ pkgs, config, ... }:
let
  patched-qutebrowser = pkgs.qutebrowser.overrideAttrs (finalAttrs: previousAttrs: {
    patches = previousAttrs.patches ++ [ ./patches/qute-keepassxc-fuzzel.patch ];
  });
in
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
    package = patched-qutebrowser;
    extraConfig = ''
      import catppuccin
      catppuccin.setup(c, "mocha", True)
    '';

    settings = {
      colors.webpage.preferred_color_scheme = "dark";
      colors.webpage.darkmode.enabled = true;
      auto_save.session = true;
      completion.shrink = true;
    };

    keyBindings = {
      normal = {
        "<Shift+Down>" = "tab-next";
        "<Shift+Up>" = "tab-prev";
        "<Shift+Left>" = "back";
        "<Shift+Right>" = "forward";

        "<Space>td" = "config-cycle colors.webpage.darkmode.enabled true false";
        "<Space>om" = "spawn mpv {url}";
        "<Space>p" = "spawn --userscript qute-keepassxc --key 7A61DCB093726134010AE4ED0A7CE8DCD12B903C";
      };

      caret = {
        "<Down>" = "move-to-next-line";
        "<Up>" = "move-to-prev-line";
        "<Left>" = "move-to-prev-char";
        "<Right>" = "move-to-next-char";

        "<Shift+Down>" = "scroll down";
        "<Shift+Up>" = "scroll up";
        "<Shift+Left>" = "scroll left";
        "<Shift+Right>" = "scroll down";
      };
    };
  };
}
