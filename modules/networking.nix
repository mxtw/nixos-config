{
  flake.modules.nixos.networking = { pkgs, ... }: {
    networking.networkmanager.enable = true;
    networking.firewall.checkReversePath = false;

    hardware.bluetooth.enable = true;
    hardware.bluetooth.powerOnBoot = true;
    services.blueman.enable = true;

    services.resolved.enable = true;

    environment.systemPackages = with pkgs; [
      nmap
      dig
      tcpdump
      whois

      protonvpn-gui
      wakeonlan
    ];

    programs.wireshark = {
      enable = true;
      package = pkgs.wireshark;
    };

    users.users.max.extraGroups = [
      "networkmanager"
      "wireshark"
    ];
  };
}
