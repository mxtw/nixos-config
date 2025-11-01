{ pkgs, config, ... }:
let
  catppuccin-aerc = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "aerc";
    rev = "3580c723ee071e512d5e41bf88cea837b4f23746";
    sha256 = "jYFk8eZ3um5S7DxiGbGHGa05/HkxYYrqUX8cEhNEEu0=";
  };
in
{
  # need to first set it up with
  # systemctl stop --user protonmail-bridge.service
  # protonmail-bridge --cli ...
  # systemctl start --user protonmail-bridge.service
  home.packages = [ pkgs.protonmail-bridge ];
  services.protonmail-bridge.enable = true;

  accounts.email.accounts = {
    max = {
      primary = true;
      enable = true;
      realName = "max";
      userName = "max@macks.cloud";
      address = "max@macks.cloud";
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
    };
  };

  xdg.configFile."aerc/stylesets/catppuccin-mocha".source = "${catppuccin-aerc}/dist/catppuccin-mocha";
  programs.aerc = {
    enable = true;
    extraConfig = {
      general.unsafe-accounts-conf = true;
      ui = {
        border-char-vertical = "│";
        border-char-horizontal = "─";
        styleset-name = "catppuccin-mocha";
        sort = "-r date";
        mouse-enabled = true;
      };
      filters = {
        "text/html" = "${pkgs.aerc}/libexec/aerc/filters/html -o display_link_number=true | ${pkgs.aerc}/libexec/aerc/filters/colorize";
        "text/plain" = "${pkgs.aerc}/libexec/aerc/filters/colorize";
        # home-manager sorts those alphabetically so this breaks :/
        # "text/*" = ''${pkgs.bat}/bin/bat -fP --file-name="$AERC_FILENAME" --style=plain'';
        "application/pdf" = "${pkgs.zathura}/bin/zathura -";
        "audio/*" = "${pkgs.mpv}/bin/mpv -";
        "image/*" = "${pkgs.feh}/bin/feh -";
      };
    };
  };
}
