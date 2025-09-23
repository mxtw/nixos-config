{
  imports = [ ../../home/default.nix ];

  config.modules = {
    fuzzel.enable = true;

    river.enable = true;
    river.colemak = true;
    waybar.enable = true;

    yambar = {
      enable = false;
      layout = true;
      pulse = true;
      cpu = true;
      mem = true;
      battery = true;
      clock = true;
    };
  };
}
