{
  flake.modules.nixos.boot = { pkgs, ... }: {
    boot = {
      loader = {
        systemd-boot.enable = false;
        efi.canTouchEfiVariables = true;
      };
      lanzaboote = {
        enable = true;
        pkiBundle = "/var/lib/sbctl";
      };
      tmp.cleanOnBoot = true;
      kernelPackages = pkgs.linuxPackages_zen;
    };
    environment.systemPackages = [ pkgs.sbctl ];
  };
}
