{
  programs.iamb = {
    enable = true;
    settings = {
      default_profile = "macks";
      profiles = {
        admin.user_id = "@admin:macks.cloud";
        macks.user_id = "@macks:macks.cloud";
      };
    };
  };
}
