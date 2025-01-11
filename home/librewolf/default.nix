{
  programs.librewolf = {
    enable = true;
    settings = {
      "privacy.clearOnShutdown.history" = false;
      "privacy.clearOnShutdown.downloads" = false;

      "privacy.resistFingerprinting.testGranularityMask" = 4;
      "privacy.resistFingerprinting.exemptedDomains" = "monkeytype.com, netflix.com, paypal.com, *.paypal.com, *.netflix.com";
    };
  };
}
