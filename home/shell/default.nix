{

  programs.fish = {
    enable = true;
    shellAliases = {
      ls = "eza";
      ll = "eza -lah";
      vim = "nvim";
    };
    shellAbbrs = {
      lg = "lazygit";
    };
  };
  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
    options = [
      "--cmd cd"
    ];
  };

  programs.eza = {
    enable = true;
    enableFishIntegration = true;
  };
}
