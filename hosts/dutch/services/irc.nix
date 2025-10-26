{ config, lib, ... }:
let
  domainName = "irc.macks.cloud";
  sslCertDir = config.security.acme.certs.${domainName}.directory;
in
{
  users.users.soju = {
    isSystemUser = true;
    group = "soju";
  };
  users.groups.soju = { };
  systemd.services.soju.serviceConfig = {
    User = "soju";
    Group = "soju";
    DynamicUser = lib.mkForce false;
  };
  security.acme.certs = {
    "${domainName}" = {
      domain = "${domainName}";
      group = "soju";
      postRun = "systemctl reload soju.service";
    };
  };
  # TODO: enable file uploads
  services.soju = {
    enable = true;
    listen = [ ":6697" "http://localhost:6698" ];
    hostName = "irc.macks.cloud";
    tlsCertificate = "${sslCertDir}/cert.pem";
    tlsCertificateKey = "${sslCertDir}/key.pem";
  };
  services.nginx.virtualHosts."irc.macks.cloud" = {
    forceSSL = true;
    useACMEHost = "macks.cloud";
    locations."/".proxyPass = "http://127.0.0.1:6698";
  };
}
