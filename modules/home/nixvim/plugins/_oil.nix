{
  programs.nixvim = {
    plugins.oil = {
      enable = true;
      settings.columns = [
        "icon"
        "permissions"
        "size"
        "mtime"
      ];
    };

    keymaps = [
      {
        action = "<cmd>Oil<CR>";
        key = "<leader>-";
        options = {
          silent = true;
        };
      }
    ];
  };
}
