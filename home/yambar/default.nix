{ config, ... }:
{
  programs.yambar.enable = true;

  home.file = {
    "${config.xdg.configHome}/yambar/config.yml" = {
      source = ./config.yml;
    };
  };
}
