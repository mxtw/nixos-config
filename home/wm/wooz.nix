{ pkgs, inputs, ... }:
{
  home.packages = [
    inputs.wooz.packages.${pkgs.system}.default
  ];
}
