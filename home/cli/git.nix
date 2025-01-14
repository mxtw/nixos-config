{
  programs.git = {
    enable = true;

    userEmail = "max@macks.cloud";
    userName = "max";

    signing.key = "/home/max/.ssh/id_ed25519.pub";
    signing.signByDefault = true;

    extraConfig = {
      gpg.format = "ssh";
    };
  };

  programs.lazygit.enable = true;
}
