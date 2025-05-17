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
      colors.webpage.darkmode.policy.images = "never";
      auto_save.session = true;
      completion.shrink = true;
      hints.chars = "arstgmneio";

      content.blocking.enabled = true;
      content.blocking.method = "auto";
      content.blocking.adblock.lists = [
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances-cookies.txt"
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances.txt"
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badlists.txt"
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badlists.txt"
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badware.txt"
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2020.txt"
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2021.txt"
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2022.txt"
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2023.txt"
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2024.txt"
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters.txt"
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/legacy.txt"
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/privacy.txt"
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/quick-fixes.txt"
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/resource-abuse.txt"
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/unbreak.txt"
      ];
      content.cookies.accept = "no-3rdparty";
      content.webrtc_ip_handling_policy = "default-public-interface-only";

      tabs.show = "multiple";
      tabs.show_switching_delay = 1500;
      tabs.position = "top";
      tabs.width = "8%";

      statusbar.show = "in-mode";
    };

    keyBindings = {
      normal = {
        "<Shift+Down>" = "tab-next";
        "<Shift+Up>" = "tab-prev";
        "<Shift+Left>" = "back";
        "<Shift+Right>" = "forward";

        "T" = "cmd-set-text -s :tab-select";

        "<Space>td" = "config-cycle colors.webpage.darkmode.enabled true false";
        "<Space>tts" = "config-cycle tabs.show multiple switching";
        "<Space>ttp" = "config-cycle tabs.position top left";
        "<Space>m" = "spawn umpv {url}";
        "<Space>M" = "hint links spawn umpv {hint-url}";
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
