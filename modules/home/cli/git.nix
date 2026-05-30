{
  flake.modules.homeManager.git = {
    programs.git = {
      enable = true;

      signing.key = "/home/max/.ssh/id_ed25519.pub";
      signing.signByDefault = true;
      settings = {
        user.email = "max@macks.cloud";
        user.name = "max";
        gpg.format = "ssh";
        init.defaultBranch = "main";
        pull.rebase = true;
        pull.autostash = true;
      };
    };

    programs.difftastic = {
      enable = true;
      git.enable = true;
    };

    programs.lazygit = {
      enable = true;
      settings = {
        git.diffRenderers = [
          {
            command = "difft --color=always";
            type = "extDiff";
          }
        ];
        gui.theme = {
          activeBorderColor = [ "#ebdbb2" "bold" ];
          inactiveBorderColor = [ "#928374" ];
          optionsTextColor = [ "#83a598" ];
          selectedLineBgColor = [ "#282828" ];
          cherryPickedCommitBgColor = [ "#282828" ];
          cherryPickedCommitFgColor = [ "#ebdbb2" ];
          unstagedChangesColor = [ "#d3869b" ];
          defaultFgColor = [ "#ebdbb2" ];
          searchingActiveBorderColor = [ "#fabd2f" ];
          authorColors."*" = [ "#ebdbb2" ];
        };
      };
    };

    programs.gh.enable = true;
  };
}
