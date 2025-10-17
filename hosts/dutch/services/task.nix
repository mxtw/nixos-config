{ config, ... }:
{
  sops.secrets.taskwarrior_uuid = { };
  services.taskchampion-sync-server = {
    enable = true;
    host = "127.0.0.1";
    port = 10222;
    allowClientIds = [ config.sops.secrets.taskwarrior_uuid.content ];
  };
  services.nginx.virtualHosts."task.macks.cloud" = {
    forceSSL = true;
    useACMEHost = "macks.cloud";
    locations."/".proxyPass = "http://127.0.0.1:10222";
  };
}
