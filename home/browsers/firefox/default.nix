{
  imports = [
    ./extensions.nix
    ./policies.nix
  ];

  programs.firefox = {
    enable = true;
    profiles.max = {
      search.default = "ddg";
      search.force = true;
      settings = {
        "browser.search.region" = "DE";
        "browser.search.isUS" = false;
        "browser.compactomode.show" = true;
        "browser.uidensity" = 1;
        "browser.uiCustomization.state" = ''
          {
            "placements": {
              "widget-overflow-fixed-list": [],
              "unified-extensions-area": [],
              "nav-bar": [
                "sidebar-button",
                "back-button",
                "forward-button",
                "stop-reload-button",
                "unified-extensions-button",
                "downloads-button",
                "vertical-spacer",
                "urlbar-container",
                "personal-bookmarks"
              ],
              "toolbar-menubar": [
                "menubar-items"
              ],
              "TabsToolbar": [],
              "vertical-tabs": [
                "tabbrowser-tabs"
              ],
              "PersonalToolbar": []
            },
            "seen": [],
            "dirtyAreaCache": [
              "nav-bar",
              "vertical-tabs",
              "PersonalToolbar",
              "toolbar-menubar",
              "TabsToolbar",
              "unified-extensions-area",
              "widget-overflow-fixed-list"
            ],
            "currentVersion": 23,
            "newElementCount": 18
          }
        '';
        "browser.tabs.inTitlebar" = 0;
        "sidebar.verticalTabs" = true;
        "sidebar.verticalTabs.dragToPinPromo.dismissed" = true;
        "apps.normandy.enabled" = false;
        "extensions.autoDisableScopes" = 0;
      };
    };
  };
}
