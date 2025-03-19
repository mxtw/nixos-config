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
      pull.rebase = true;
    };

    difftastic.enable = true;
  };

  programs.lazygit = {
    enable = true;
    settings = {
      git.paging.externalDiffCommand = "difft --color=always";


      gui.theme = {
        activeBorderColor = [ "#b4befe" "bold" ];
        inactiveBorderColor = [ "#a6adc8" ];
        optionsTextColor = [ "#89b4fa" ];
        selectedLineBgColor = [ "#313244" ];
        cherryPickedCommitBgColor = [ "#45475a" ];
        cherryPickedCommitFgColor = [ "#b4befe" ];
        unstagedChangesColor = [ "#f38ba8" ];
        defaultFgColor = [ "#cdd6f4" ];
        searchingActiveBorderColor = [ "#f9e2af" ];
        authorColors."*" = [ "#b4befe" ];
      };
    };
  };

  programs.gh.enable = true;
}
