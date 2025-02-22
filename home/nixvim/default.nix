{ inputs, ... }:
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./plugins
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    colorschemes.rose-pine.enable = true;
    colorschemes.rose-pine.settings.styles.transparency = true;

    globals.mapleader = " ";

    opts.backspace = "2";
    opts.colorcolumn = "80";
    opts.concealcursor = "nc";
    opts.conceallevel = 2;
    opts.cursorline = true;
    opts.expandtab = true;
    opts.ignorecase = true;
    opts.list = true;
    opts.number = true;
    opts.relativenumber = true;
    opts.shiftwidth = 4;
    opts.smartindent = true;
    opts.softtabstop = 4;
    opts.splitbelow = true;
    opts.tabstop = 4;
    opts.wrap = false;



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
