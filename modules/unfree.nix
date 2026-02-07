{
  flake.modules.nixos.unfree = { lib, ... }: {
    nixpkgs.config.allowUnfree = false;
    nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
      "steam"
      "steam-unwrapped"
      "obsidian"
      "spotify"
      "tetrio-desktop"
      "wowup-cf"
    ];
  };
}
