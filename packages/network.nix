{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    nmap
    dig
    tcpdump
    whois

    protonvpn-gui
  ];

  programs.wireshark = {
    enable = true;
    package = pkgs.wireshark;
  };
}
