{ config, pkgs, ... }:
{
  programs.yambar.enable = true;

  home.file = {
    "${config.xdg.configHome}/yambar/config.yml" = {
      source = ./yambar-config.yml;
    };
    "${config.xdg.configHome}/yambar/launch.sh" = {
      source = ./yambar-launch.sh;
      executable = true;
    };
  };
  home.packages = [ pkgs.wlr-randr ];
}
