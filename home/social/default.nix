{ pkgs, config, ... }:
{
  home.file."${config.xdg.configHome}/vesktop/themes/rose-pine.css" = {
    source = builtins.fetchurl {
      url = "https://raw.githubusercontent.com/rose-pine/discord/dc0b5bda79504096021e7e398eb33dc0fb452f55/rose-pine.theme.css";
      sha256 = "1asjy6j6csdy0r4cb5kar9j00ryh1r2az4k0axvxjz35qny43p05";
    };
  };

  home.packages = with pkgs; [
    # use electron_33 to fix screen sharing bug until https://github.com/NixOS/nixpkgs/issues/380429 is fixed
    (vesktop.override {
      electron = electron_33;
    })

    weechat
  ];
}
