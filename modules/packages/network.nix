{
  flake.modules.nixos.network = { pkgs, ... }: {
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
  };
}
