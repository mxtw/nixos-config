{
  services.matrix-tuwunel = {
    enable = true;
    settings.global = {
      unix_socket_path = "/var/run/tuwunel/tuwunel.sock";
      server_name = "macks.cloud";
      allow_registration = false;
      allow_federation = true;
      allow_encryption = true;
    };
  };

  services.nginx.virtualHosts."macks.cloud" = {
    forceSSL = true;
    default = true;
    useACMEHost = "macks.cloud";
    locations."/_matrix".proxyPass = "http://unix:/var/run/tuwunel/tuwunel.sock";
    listen = [
      {
        addr = "0.0.0.0";
        port = 443;
        ssl = true;
      }
      {
        addr = "0.0.0.0";
        port = 8448;
        ssl = true;
      }
    ];
  };
  users.users.nginx.extraGroups = [ "tuwunel" ];
  networking.firewall.allowedTCPPorts = [ 443 8448 ];
}
