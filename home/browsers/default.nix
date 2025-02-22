{ pkgs, ... }:
{
  imports = [
    ./librewolf.nix
  ];

  home.packages = with pkgs; [
    ungoogled-chromium
    tor-browser-bundle-bin
  ];
}
