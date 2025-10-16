{
  imports = [ ../../home/default.nix ];

  config.modules = {
    fuzzel.enable = true;

    waybar.enable = true;

    river.enable = true;
    river.colemak = false;
  };
}
