{
  flake.modules.nixos.cli = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.git
      pkgs.fzf
      pkgs.killall
      pkgs.htop
      pkgs.btop
      pkgs.xclip
      pkgs.wl-clipboard
    ];
    programs.mosh.enable = true;
  };
}
