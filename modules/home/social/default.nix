{
  flake.modules.homeManager.social = { pkgs, ... }: {
    home.packages = with pkgs; [
      chatterino2
      streamlink
      teamspeak6-client
      profanity
    ];

    programs.vesktop.enable = true;
  };
}
