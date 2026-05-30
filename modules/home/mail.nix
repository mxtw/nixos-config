{
  flake.modules.homeManager.mail = { pkgs, config, ... }:
    let
      gruvbox-aerc = pkgs.fetchFromGitHub {
        owner = "iruzo";
        repo = "gruvbox-aerc";
        rev = "02404d48e9d7e1bb9500ab5c8cdb2820550c1567";
        sha256 = "kTNuM9YitEtk0tNXWA2opT0L24ugbCulvbCEKRJw3o4=";
      };
    in
    {
      # need to first set it up with
      # systemctl stop --user protonmail-bridge.service
      # protonmail-bridge --cli ...
      # systemctl start --user protonmail-bridge.service
      home.packages = [ pkgs.protonmail-bridge ];
      services.protonmail-bridge.enable = true;

      accounts.email = {
        maildirBasePath = ".mail";
        certificatesFile = "${config.xdg.configHome}/protonmail/bridge-v3/cert.pem";
        accounts = {
          max = {
            primary = true;
            enable = true;
            realName = "max";
            userName = "max@macks.cloud";
            address = "max@macks.cloud";
            maildir.path = "max";
            # this is not great...
            passwordCommand = "cat ${config.xdg.configHome}/protonmail/bridge-v3/.password";
            smtp = {
              host = "127.0.0.1";
              port = 1025;
              tls.enable = true;
              tls.useStartTls = true;
            };
            imap = {
              host = "127.0.0.1";
              port = 1143;
              tls.enable = true;
              tls.useStartTls = true;
            };
            aerc.enable = true;
            msmtp.enable = true;
            folders.inbox = "Inbox";
            mbsync = {
              enable = true;
              create = "maildir";
              expunge = "both";
              patterns = [ "*" "!All Mail" "!Labels/*" ];
            };
            imapnotify = {
              enable = true;
              boxes = [ "Inbox" "Folders/forwarded" ];
              onNotify = "${pkgs.isync}/bin/mbsync max";
            };
          };
        };
      };
      programs.mbsync.enable = true;
      services.mbsync.enable = true;
      services.imapnotify.enable = true;
      services.imapnotify.path = [ pkgs.coreutils-full ]; # needed in passwordCmd
      programs.msmtp.enable = true;

      xdg.configFile."aerc/stylesets/gruvbox-dark".source = "${gruvbox-aerc}/gruvbox-dark";
      programs.aerc = {
        enable = true;
        extraAccounts.max.source = "maildir://~/.mail/max";
        extraConfig = {
          general.unsafe-accounts-conf = true;
          ui = {
            border-char-vertical = "│";
            border-char-horizontal = "─";
            styleset-name = "gruvbox-dark";
            sort = "-r date";
            mouse-enabled = true;
          };
          filters = {
            "text/html" = "${pkgs.aerc}/libexec/aerc/filters/html -o display_link_number=true | ${pkgs.aerc}/libexec/aerc/filters/colorize";
            "text/plain" = "${pkgs.aerc}/libexec/aerc/filters/colorize";
            "message/rfc822" = "${pkgs.aerc}/libexec/aerc/filters/colorize";
            # home-manager sorts those alphabetically so this breaks :/
            # "text/*" = ''${pkgs.bat}/bin/bat -fP --file-name="$AERC_FILENAME" --style=plain'';
            "application/pdf" = "${pkgs.zathura}/bin/zathura -";
            "audio/*" = "${pkgs.mpv}/bin/mpv -";
            "image/*" = "${pkgs.feh}/bin/feh -";
          };
        };
      };
    };
}
