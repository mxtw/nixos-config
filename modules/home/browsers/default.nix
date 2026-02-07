{
  flake.modules.homeManager.browsers = { pkgs, ... }: {
    home.sessionVariables.BROWSER = "firefox";

    home.packages = with pkgs; [
      tor-browser
      w3m
      chawan
    ];
  };
}
