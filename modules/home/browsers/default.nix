{ self, ... }: {
  flake.modules.homeManager.browsers = { pkgs, ... }: {
    imports = with self.modules.homeManager; [
      firefox
    ];

    home.sessionVariables.BROWSER = "firefox";

    home.packages = with pkgs; [
      tor-browser
      w3m
      chawan
    ];
  };
}
