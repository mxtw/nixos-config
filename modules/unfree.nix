{
  flake.modules.nixos.unfree = { lib, ... }: {
    nixpkgs.config.allowUnfree = false;
    nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
      "obsidian"
      "spotify"
      "steam"
      "steam-unwrapped"
      "teamspeak6-client"
      "tetrio-desktop"
      "wowup-cf"
    ];
  };
}
