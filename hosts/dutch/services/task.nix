{
  services.taskchampion-sync-server = {
    enable = true;
    host = "127.0.0.1";
    port = 10222;
  };
  services.nginx.virtualHosts."task.macks.cloud" = {
    forceSSL = true;
    useACMEHost = "macks.cloud";
    locations."/".proxyPass = "http://127.0.0.1:10222";
  };
}
