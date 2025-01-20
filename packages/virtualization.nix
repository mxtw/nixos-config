{
  virtualisation.podman = {
    enable = true;
    autoPrune.enable = true;
    autoPrune.dates = "weekly";

    dockerCompat = true;
    dockerSocket.enable = true;
  };
}
