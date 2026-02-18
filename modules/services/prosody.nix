{
  flake.modules.nixos.prosody = { config, ... }:
    let
      domainName = "macks.cloud";
      sslCertDir = config.security.acme.certs.${domainName}.directory;
    in
    {
      users.users.prosody = {
        isSystemUser = true;
        extraGroups = [ "nginx" ];
      };
      services.prosody = {
        enable = true;
        admins = [ "admin@${domainName}" ];
        s2sSecureAuth = true;
        virtualHosts."mcloud" = {
          ssl = {
            cert = "${sslCertDir}/fullchain.pem";
            key = "${sslCertDir}/key.pem";
          };
          domain = "${domainName}";
          enabled = true;
        };
        muc = [
          {
            domain = "muc.${domainName}";
            restrictRoomCreation = false;
          }
        ];
        xmppComplianceSuite = false; # TODO: implement entire suite
        extraConfig = ''
          storage = "sql"
          sql = {
            driver = "SQLite3";
            database = "prosody.sqlite"; -- The database name to use. For SQLite3 this the database filename (relative to the data storage directory).
          }
        '';
      };
      networking.firewall.allowedTCPPorts = [
        5222
        5223
      ];
    };
}
