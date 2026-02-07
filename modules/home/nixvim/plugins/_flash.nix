{
  programs.nixvim = {
    plugins.flash = {
      enable = true;
      settings = {
        jump.autojump = false;
      };
    };

    keymaps = [
      {
        action.__raw = ''function() require("flash").jump() end'';
        key = "s";
        options.silent = true;
        mode = [ "n" ];
      }
    ];
  };
}
