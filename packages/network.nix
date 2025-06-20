{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    nmap
    dig
    tcpdump
    whois
    bandwhich

    protonvpn-gui
  ];

  programs.wireshark = {
    enable = true;
    package = pkgs.wireshark;
  };
}
