{ pkgs, ... }:
{
  home.packages = with pkgs; [ taskwarrior-tui ];
  programs.taskwarrior = {
    enable = true;
    package = pkgs.taskwarrior3;
  };
  programs.fish.shellAbbrs = {
    tw = "taskwarrior-tui";
  };
}
