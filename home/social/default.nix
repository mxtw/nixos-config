{ pkgs, config, ... }:
{
  sops.secrets.soju-password = { };
  home.packages = with pkgs; [
    vesktop
    weechat

    chatterino2
    streamlink
  ];

  programs.halloy = {
    enable = true;
    settings = {
      servers.soju = {
        channels = [ ];
        nickname = "mxtw";
        sasl.plain = {
          username = "mxtw";
          password_file = config.sops.secrets.soju-password.path;
        };
        server = "irc.macks.cloud";
        use_tls = true;
        port = 6697;
      };
    };
  };
}
