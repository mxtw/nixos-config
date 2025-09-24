{
  imports = [ ../../home/default.nix ];

  config.modules = {
    fuzzel.enable = true;

    waybar.enable = true;

    river.enable = true;
    river.colemak = false;

    yambar = {
      enable = false;
      layout = true;
      pulse = true;
      cpu = true;
      mem = true;
      battery = false;
      clock = true;
    };
  };
}
