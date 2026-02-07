{
  flake.modules.homeManager.services = { pkgs, ... }: {
    home.packages = with pkgs; [
      nextcloud-client
    ];

    services.nextcloud-client = {
      enable = true;
      startInBackground = true;
      package = pkgs.nextcloud-client;
    };

    services.ssh-agent.enable = true;
  };
}
