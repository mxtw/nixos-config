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
      };
    };

    programs.gh.enable = true;
  };
}
