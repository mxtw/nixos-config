{
  flake.modules.nixos.git-mirror = { pkgs, lib, ... }:
    let
      mkMirror = repos:
        let
          mkOne = repo:
            let
              name = repo.name;
              url = repo.url;
              targetDir = repo.targetDir or "/data/git/public/mirrors/${name}";
            in
            {
              systemd.services."git-mirror-${name}" = {
                description = "sync git repo ${name}";
                serviceConfig = {
                  Type = "oneshot";
                  ExecStart = ''
                    ${pkgs.bash}/bin/bash -c "${pkgs.git}/bin/git clone --bare ${url} ${targetDir} || (cd ${targetDir} && ${pkgs.git}/bin/git fetch -a)"
                  '';
                };
              };
              systemd.timers."git-mirror-${name}" = {
                wantedBy = [ "timers.target" ];
                timerConfig = {
                  OnCalendar = "daily";
                  Persistent = true;
                };
              };
            };
        in
        lib.foldl' lib.recursiveUpdate { } (map mkOne repos);
    in
    {
      config = mkMirror [
        {
          name = "hydrocheck";
          url = "https://github.com/mxtw/hydrocheck";
        }
        {
          name = "nixos-config";
          url = "https://github.com/mxtw/nixos-config";
        }
        {
          name = "rico";
          url = "https://github.com/mxtw/rico";
        }
      ];
    };
}
