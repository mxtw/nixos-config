{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # use electron_33 to fix screen sharing bug until https://github.com/NixOS/nixpkgs/issues/380429 is fixed
    (vesktop.override {
      electron = electron_33;
    })

    weechat
  ];
}
