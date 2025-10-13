{ pkgs, ... }:
{
  services.cgit = {
    "git.macks.cloud" = {
      enable = true;
      scanPath = "/data/git";
      package = pkgs.cgit-pink;
    };
  };
  services.nginx.virtualHosts."git.macks.cloud".forceSSL = true;
  services.nginx.virtualHosts."git.macks.cloud".enableACME = true;

  users = {
    users.git = {
      isSystemUser = true;
      group = "git";
      home = "/data/git";
      createHome = true;
      shell = "${pkgs.git}/bin/git-shell";
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICOZx2ejqskuEDw9ZagBJ/srl0kZHki5VwYa2oxM/+Yi max"
      ];
    };
    groups.git = { };
  };
}
