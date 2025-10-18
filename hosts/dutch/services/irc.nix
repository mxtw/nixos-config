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
  services.soju = {
    enable = true;
    listen = [ ":6697" ];
    hostName = "irc.macks.cloud";
    tlsCertificate = "${sslCertDir}/cert.pem";
    tlsCertificateKey = "${sslCertDir}/key.pem";
  };
}
