{ pkgs, inputs, ... }:
{
  programs.firefox.profiles.max.extensions = {
    force = true;
    packages = with inputs.firefox-addons.packages.${pkgs.system}; [
      darkreader
      firefox-color
      keepassxc-browser
      linkding-extension
      sponsorblock
      ublock-origin

      # this is outdated, find an alternative, see https://github.com/samuelmaddock/metastream/issues/456
      (inputs.firefox-addons.lib.${pkgs.system}.buildFirefoxXpiAddon rec {
        pname = "metastream_remote";
        version = "0.6.0";
        url = "https://addons.mozilla.org/firefox/downloads/file/3613248/metastream_remote-${version}.xpi";
        addonId = "{da2b93f0-35d5-461e-9bc7-6ba10aef1af4}";
        meta = { };
        sha256 = "sha256-FojzN0RAym+BXYHQfbo7Hr6wR7imAzOxlwJsoGak8io=";
      })
    ];
    settings = {
      "uBlock0@raymondhill.net" = {
        force = true;
        settings = {
          selectedFilterLists = [
            "user-filters"
            "ublock-filters"
            "ublock-badware"
            "ublock-privacy"
            "ublock-quick-fixes"
            "ublock-unbreak"
            "easylist"
            "easyprivacy"
            "urlhaus-1"
            "plowe-0"
            "fanboy-cookiemonster"
            "ublock-cookies-easylist"
            "adguard-cookies"
            "ublock-cookies-adguard"
            "fanboy-social"
            "adguard-social"
            "fanboy-thirdparty_social"
            "easylist-chat"
            "easylist-newsletters"
            "easylist-notifications"
            "easylist-annoyances"
            "adguard-mobile-app-banners"
            "adguard-other-annoyances"
            "adguard-popup-overlays"
            "adguard-widgets"
            "ublock-annoyances"
          ];
        };
      };
      "FirefoxColor@mozilla.com" = {
        force = true;
        settings.firstRunDone = true;
        settings.theme = {
          title = "theme";
          images = { };
          properties = {
            additional_backgrounds_alignment = [ "top" ];
            additional_backgrounds_tiling = [ "repeat" ];
          };
          colors = {
            toolbar = { r = 30; g = 30; b = 46; };
            toolbar_text = { r = 205; g = 214; b = 244; };
            frame = { r = 17; g = 17; b = 27; };
            tab_background_text = { r = 205; g = 214; b = 244; };
            toolbar_field = { r = 24; g = 24; b = 37; };
            toolbar_field_text = { r = 205; g = 214; b = 244; };
            tab_line = { r = 180; g = 190; b = 254; };
            popup = { r = 30; g = 30; b = 46; };
            popup_text = { r = 205; g = 214; b = 244; };
            button_background_active = { r = 108; g = 112; b = 134; };
            frame_inactive = { r = 17; g = 17; b = 27; };
            icons_attention = { r = 180; g = 190; b = 254; };
            icons = { r = 180; g = 190; b = 254; };
            ntp_background = { r = 17; g = 17; b = 27; };
            ntp_text = { r = 205; g = 214; b = 244; };
            popup_border = { r = 180; g = 190; b = 254; };
            popup_highlight_text = { r = 205; g = 214; b = 244; };
            popup_highlight = { r = 108; g = 112; b = 134; };
            sidebar_border = { r = 180; g = 190; b = 254; };
            sidebar_highlight_text = { r = 17; g = 17; b = 27; };
            sidebar_highlight = { r = 180; g = 190; b = 254; };
            sidebar_text = { r = 205; g = 214; b = 244; };
            sidebar = { r = 30; g = 30; b = 46; };
            tab_background_separator = { r = 180; g = 190; b = 254; };
            tab_loading = { r = 180; g = 190; b = 254; };
            tab_selected = { r = 30; g = 30; b = 46; };
            tab_text = { r = 205; g = 214; b = 244; };
            toolbar_bottom_separator = { r = 30; g = 30; b = 46; };
            toolbar_field_border_focus = { r = 180; g = 190; b = 254; };
            toolbar_field_border = { r = 30; g = 30; b = 46; };
            toolbar_field_focus = { r = 30; g = 30; b = 46; };
            toolbar_field_highlight_text = { r = 30; g = 30; b = 46; };
            toolbar_field_highlight = { r = 180; g = 190; b = 254; };
            toolbar_field_separator = { r = 180; g = 190; b = 254; };
            toolbar_vertical_separator = { r = 180; g = 190; b = 254; };
          };
        };
      };
    };
  };
}
