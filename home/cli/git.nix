{
  programs.git = {
    enable = true;

    userEmail = "max@macks.cloud";
    userName = "max";

    signing.key = "/home/max/.ssh/id_ed25519.pub";
    signing.signByDefault = true;

    extraConfig = {
      gpg.format = "ssh";
      init.defaultBranch = "main";
    };

    difftastic.enable = true;
  };

  programs.lazygit = {
    enable = true;
    settings = {
      git.paging.externalDiffCommand = "difft --color=always";

      gui.theme = {
        activeBorderColor = [ "#ebbcba" "bold" ];
        inactiveBorderColor = [ "#908caa" ];
        optionsTextColor = [ "#9ccfd8" ];
        selectedLineBgColor = [ "#908caa" ];
        cherryPickedCommitBgColor = [ "#6e6a86" ];
        cherryPickedCommitFgColor = [ "#ebbcba" ];
        unstagedChangesColor = [ "#eb6f92" ];
        defaultFgColor = [ "#e0def4" ];
        searchingActiveBorderColor = [ "#f6c177" ];
        authorColors."*" = [ "#ebbcba" ];
      };
    };
  };

  programs.gh.enable = true;
}
