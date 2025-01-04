{
  imports = [ ../../home/default.nix ];

  config.modules = {
    fuzzel.enable = true;

    river.enable = true;
    river.colemak = true;
  };
}
