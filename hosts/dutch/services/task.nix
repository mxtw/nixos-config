{
  services.taskchampion-sync-server = {
    enable = true;
    host = "127.0.0.1";
    port = 10222;
    allowClientIds = [ "125f47cf-db71-4da5-8371-70ea7f6c9768" ];
  };
  services.nginx.virtualHosts."task.macks.cloud" = {
    forceSSL = true;
    useACMEHost = "macks.cloud";
    locations."/".proxyPass = "http://127.0.0.1:10222";
  };
}
