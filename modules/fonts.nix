{
  flake.modules.nixos.fonts = { pkgs, ... }: {
    fonts.packages = with pkgs; [
      dejavu_fonts
      noto-fonts
      noto-fonts-color-emoji
      hack-font
      iosevka
      nerd-fonts.hack
      nerd-fonts.iosevka-term
    ];
  };
}
