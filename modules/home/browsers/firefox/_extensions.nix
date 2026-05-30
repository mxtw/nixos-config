{ pkgs, inputs, ... }:
{
  programs.firefox.profiles.max.extensions = {
    force = true;
    packages = with inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system}; [
      darkreader
      linkding-extension
      sponsorblock
      ublock-origin
      web-archives
      kagi-search

      # this is outdated, find an alternative, see https://github.com/samuelmaddock/metastream/issues/456
      (inputs.firefox-addons.lib.${pkgs.stdenv.hostPlatform.system}.buildFirefoxXpiAddon rec {
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
    };
  };
}
