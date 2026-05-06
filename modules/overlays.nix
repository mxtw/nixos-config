{
  flake.modules.nixos.overlays = {
    nixpkgs.overlays = [
      (final: prev: {
        openldap = prev.openldap.overrideAttrs
          (_: {
            doCheck = false;
          });
      })
    ];
  };
}
