{
  imports = [ ../../home/default.nix ];

  config.modules = {
    fuzzel.enable = true;

    hyprland.enable = false;
    waybar.enable = false;

    river.enable = true;
    river.colemak = false;

    yambar = {
      enable = true;
      layout = true;
      pulse = true;
      cpu = true;
      mem = true;
      battery = false;
      clock = true;
    };
  };
}
