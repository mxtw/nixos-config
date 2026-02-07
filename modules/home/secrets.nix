{
  flake.modules.homeManager.secrets = { inputs, pkgs, config, ... }: {
    imports = [
      inputs.sops-nix.homeManagerModules.sops
    ];

    sops.age.keyFile = "${config.xdg.configHome}/sops/age/keys.txt";
    sops.defaultSopsFile = ../../secrets.yaml;

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
    programs.gpg.enable = true;
    services.gpg-agent = {
      enable = true;
      pinentry.package = pkgs.pinentry-all;
      pinentry.program = "pinentry-qt";
      enableFishIntegration = true;
    };
    programs.password-store = {
      enable = true;
      settings.PASSWORD_STORE_DIR = "${config.home.homeDirectory}/.password-store";
    };
  };
}
