{ pkgs, config, ... }:
{
  sops.secrets.taskwarrior-config = { };
  home.packages = with pkgs; [ taskwarrior-tui ];
  programs.taskwarrior = {
    enable = true;
    package = pkgs.taskwarrior3;
    extraConfig = ''
      include ${config.sops.secrets.taskwarrior-config.path}
    '';
  };
  programs.fish.shellAbbrs = {
    tw = "taskwarrior-tui";
  };
}
