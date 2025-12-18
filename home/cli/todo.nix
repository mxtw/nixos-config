{ pkgs, config, ... }:
{
  sops.secrets.taskwarrior-config = { };
  programs.taskwarrior = {
    enable = true;
    package = pkgs.taskwarrior3;
    config = {
      sync.server.client_id = "125f47cf-db71-4da5-8371-70ea7f6c9768";
      sync.server.url = "https://task.macks.cloud";
    };
    # extraconfig includes encryption secret
    extraConfig = ''
      include ${config.sops.secrets.taskwarrior-config.path}
    '';
  };
  services.taskwarrior-sync = {
    enable = true;
    package = pkgs.taskwarrior3;
  };
}
