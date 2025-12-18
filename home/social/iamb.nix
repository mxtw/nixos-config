{
  programs.iamb = {
    enable = true;
    settings = {
      default_profile = "macks";
      profiles = {
        macks.user_id = "@macks:envs.net";
      };
    };
  };
}
