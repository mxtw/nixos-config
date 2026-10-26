{
  flake.modules.homeManager.calendar = { config, ... }: {
    sops.secrets.calendar-password = { };
    programs.khal.enable = true;
    services.vdirsyncer.enable = true;
    programs.vdirsyncer.enable = true;
    accounts.calendar = {
      basePath = ".calendar";
      accounts = {
        personal = {
          primary = true;
          local.type = "filesystem";
          remote = {
            type = "caldav";
            url = "https://calendar.macks.cloud/max/personal";
            userName = "max";
            passwordCommand = [ "cat" config.sops.secrets.calendar-password.path ];
          };
          khal = {
            enable = true;
            addresses = [ "max@macks.cloud" ];
          };
          vdirsyncer = {
            enable = true;
            collections = null;
          };
        };
      };
    };
  };
}
