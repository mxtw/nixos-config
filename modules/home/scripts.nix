{
  flake.modules.homeManager.scripts = { pkgs, ... }:
    let
      powermenu = pkgs.writeShellScriptBin "powermenu" ./scripts/powermenu;
      ocr = pkgs.writeShellScriptBin "ocr" ./scripts/ocr;
      pass-fuzzel = pkgs.writeShellScriptBin "pass-fuzzel" ./scripts/pass-fuzzel;
    in
    {
      home.packages = with pkgs;
        [
          powermenu
          ocr
          tesseract
          libnotify
          pass-fuzzel
        ];
    };
}
