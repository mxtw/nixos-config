{ config, lib, inputs, ...}:

{
  imports = [ ../../home/default.nix ];

  config.modules = {
    fuzzel.enable = true;
  };
}
