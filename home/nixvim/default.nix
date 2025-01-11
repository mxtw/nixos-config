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
  };
}
