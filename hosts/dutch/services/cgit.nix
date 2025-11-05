{ pkgs, ... }:
{
  services.cgit = {
    "git.macks.cloud" = {
      enable = true;
      scanPath = "/data/git";
      package = pkgs.cgit-pink;
      settings = {
        section-from-path = 1;
        root-title = "git.macks.cloud";
        root-desc = "welcome to some of my small projects";
        readme = ":README.md";
        about-filter = "${pkgs.cgit-pink}/lib/cgit/filters/about-formatting.sh";
        source-filter = "${pkgs.cgit-pink}/lib/cgit/filters/syntax-highlighting.py";
        enable-git-config = true;
      };
    };
  };
  services.nginx.virtualHosts."git.macks.cloud".forceSSL = true;
  services.nginx.virtualHosts."git.macks.cloud".useACMEHost = "macks.cloud";

  users = {
    users.git = {
      isSystemUser = true;
      group = "git";
      home = "/data/git";
      createHome = true;
      shell = "${pkgs.git}/bin/git-shell";
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICOZx2ejqskuEDw9ZagBJ/srl0kZHki5VwYa2oxM/+Yi"
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJ96dj94d7joqGSLX4NPiFFk9rsXrw4lUlP5LnyU5ZZT"
      ];
    };
    groups.git = { };
  };
}
