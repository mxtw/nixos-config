{
  flake.modules.nixos.user = { config, pkgs, ... }: {
    users.motdFile = ./${config.networking.hostName}/motd.txt;
    users.users.max = {
      isNormalUser = true;
      description = "max";
      extraGroups = [
        "wheel"
        "dialout" # needed for chirp
      ];
      shell = pkgs.fish;
      openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICOZx2ejqskuEDw9ZagBJ/srl0kZHki5VwYa2oxM/+Yi max" ];
    };
    programs.fish.enable = true;
  };
}
