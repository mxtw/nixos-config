{ inputs, ... }:
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./plugins
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    colorschemes.catppuccin.enable = true;
    colorschemes.catppuccin.settings.transparent_background = true;

    globals.mapleader = " ";

    opts.number = true;
    opts.relativenumber = true;
    opts.tabstop = 4;
    opts.softtabstop = 4;
    opts.expandtab = true;
    opts.backspace = "2";
    opts.smartindent = true;
    opts.shiftwidth = 4;
    opts.wrap = false;
    opts.list = true;

    keymaps = [
      {
        action = "<cmd>e#<cr>";
        key = "<leader>.";
        options.desc = "Switch to last buffer";
      }
      {
        action = "<cmd>bd<cr>";
        key = "<leader>bd";
        options.desc = "Delete buffer";
      }
      {
        action = "<cmd>windo diffthis<cr>";
        key = "<leader>dd";
        options.desc = "Diff open buffers";
      }
      {
        action = "<cmd>diffthis<cr>";
        key = "<leader>dD";
        options.desc = "diff";
      }

      {
        action = "<cmd>split<cr>";
        key = "<leader>ws";
        options.desc = "split";
      }
      {
        action = "<cmd>vsplit<cr>";
        key = "<leader>wv";
        options.desc = "split";
      }
    ];
  };
}
