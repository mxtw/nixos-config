{
  flake.modules.homeManager.mako = {
    services.mako = {
      enable = true;
      settings = {
        font = "IosevkaTerm Nerd Font 10";
        text-color = "#ebdbb2ff";
        border-color = "#ebdbb2ff";
        background-color = "#282828e6";
        default-timeout = 5000;
      };
    };
  };
}
