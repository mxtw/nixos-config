{
  programs.firefox.policies = {
    DisableFeedbackCommands = true;
    DisableFirefoxStudies = true;
    DisableTelemetry = true;
    DisplayBookmarksToolbar = "never";
    DontCheckDefaultBrowser = true;
    EnableTrackingProtection = {
      Value = true;
      Locked = false;
      Cryptomining = true;
      Fingerprinting = true;
      EmailTracking = true;
      SuspectedFingerprinting = true;
    };
    FirefoxHome = {
      Highlights = false;
      TopSites = false;
      SponsoredTopSites = false;
      Stories = false;
      SponsoredStories = false;
    };
    Homepage = {
      URL = "about:home";
      StartPage = "previous-session";
    };
    FirefoxSuggest = {
      WebSuggestions = false;
      SponsoredSuggestions = false;
      ImproveSuggest = false;
      Locked = false;
    };
    PasswordManagerEnabled = false;
    DisableFormHistory = true;
    SanitizeOnShutdown = {
      Cache = true;
      Cookies = true;
      Downloads = false;
      History = false;
      Sessions = true;
    };
    UserMessaging = {
      ExtensionRecommendations = false;
      FeatureRecommendations = false;
      UrlbarInterventions = false;
      SkipOnboarding = true;
      MoreFromMozilla = false;
      FirefoxLabs = false;
    };
  };
}
