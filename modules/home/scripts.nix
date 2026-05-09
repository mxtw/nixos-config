{
  flake.modules.homeManager.scripts = { pkgs, config, ... }:
    let
      powermenu = pkgs.writeShellScriptBin "powermenu" ./scripts/powermenu;
      ocr = pkgs.writeShellScriptBin "ocr" ./scripts/ocr;
      pass-fuzzel = pkgs.writeShellScriptBin "pass-fuzzel" ./scripts/pass-fuzzel;
      upload = pkgs.writeShellScriptBin "upload" ''
        #!/usr/bin/env bash
        ${pkgs.copyparty-min}/bin/u2c \
            -a $(cat ${config.sops.secrets.copyparty-credentials.path}) \
            -u \
            "https://files.macks.cloud/''${2:-ss}" \
        $1
      '';
    in
    {
      sops.secrets.copyparty-credentials = { };
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

