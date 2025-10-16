{
  services.ollama = {
    # TODO: enable again
    # disabled due to broken build
    enable = false;
    acceleration = "rocm";
    rocmOverrideGfx = "11.0.1";
  };
}
