{
  # TODO: make this only load on desktop
  services.ollama = {
    enable = true;
    acceleration = "rocm";
    rocmOverrideGfx = "11.0.1";
  };
}
