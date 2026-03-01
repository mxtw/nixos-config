{
  flake.modules.homeManager.scripts = { pkgs, ... }:
    let
      powermenu = pkgs.writeShellScriptBin "powermenu" ./scripts/powermenu;
      ocr = pkgs.writeShellScriptBin "ocr" ./scripts/ocr;
      pass-fuzzel = pkgs.writeShellScriptBin "pass-fuzzel" ./scripts/pass-fuzzel;
      upload = pkgs.writeShellScriptBin "upload" ./scripts/upload;
    in
    {
      home.packages = with pkgs;
        [
          libnotify
          ocr
          pass-fuzzel
          powermenu
          tesseract
          upload
        ];
    };
}
