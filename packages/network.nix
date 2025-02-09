{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    nmap
    dig
    tcpdump
    whois
  ];

  programs.wireshark = {
    enable = true;
    package = pkgs.wireshark;
  };
}
