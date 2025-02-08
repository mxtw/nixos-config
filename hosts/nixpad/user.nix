{
  imports = [ ../../home/default.nix ];

  config.modules = {
    fuzzel.enable = true;

    river.enable = true;
    river.colemak = true;

    yambar = {
      enable = true;
      layout = true;
      pulse = true;
      cpu = true;
      mem = true;
      battery = true;
      clock = true;
    };
  };
}
