{ inputs, ...}:
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    plugins = {
      telescope = {
      	enable = true;
      };
    };


    colorschemes.catppuccin.enable = true;
    colorschemes.catppuccin.settings.transparent_background = true;

    globals.mapleader = " ";

    keymaps = [
	{
	  action = "<cmd>Telescope git_files<cr>";
	  key = "<leader><leader>";
	  options.silent = true;
	}
    ];
  };
}
