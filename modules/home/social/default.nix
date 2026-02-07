{
  flake.modules.homeManager.social = { pkgs, ... }:
    {
      home.packages = with pkgs; [
        vesktop
        chatterino2
        streamlink
      ];
    };
}
