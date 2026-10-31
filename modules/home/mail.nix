{
  flake.modules.homeManager.mail = { pkgs, ... }:
    let
      gruvbox-aerc = pkgs.fetchFromGitHub {
        owner = "iruzo";
        repo = "gruvbox-aerc";
        rev = "02404d48e9d7e1bb9500ab5c8cdb2820550c1567";
        sha256 = "kTNuM9YitEtk0tNXWA2opT0L24ugbCulvbCEKRJw3o4=";
      };
    in
    {
      accounts.email = {
        maildirBasePath = ".mail";
        accounts = {
          max = {
            primary = true;
            enable = true;
            realName = "max";
            userName = "max@macks.cloud";
            address = "max@macks.cloud";
            maildir.path = "max";
            passwordCommand = "pass mail/macks.cloud/max@macks.cloud";
            smtp = {
              host = "smtp.migadu.com";
              port = 465;
              tls.enable = true;
            };
            imap = {
              host = "imap.migadu.com";
              port = 993;
              tls.enable = true;
            };
            aerc.enable = true;
            folders.inbox = "INBOX";
          };
        };
      };

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
