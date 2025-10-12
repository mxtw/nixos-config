{
  programs.keepassxc = {
    enable = true;
    settings = {
      Browser.Enabled = true;
      GUI = {
        AdvancedSettings = true;
        ApplicationTheme = "dark";
        MinimizeOnClose = true;
        ShowTrayIcon = true;
        TrayIconAppearance = "monochrome-light";
      };
    };
  };
}
