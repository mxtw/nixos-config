{ pkgs, ... }:
let
  kiti = pkgs.buildGoModule
    {
      src = pkgs.fetchFromGitHub {
        owner = "mxtw";
        repo = "kiti";
        rev = "5626257e9835abfdb8c12d77fb69479ba7ad9ae4";
        sha256 = "9cuqHDfICqMR//vBzvimvSha7p9DQQPtWvqfZWH8mxM=";
      };
      name = "kiti";
      vendorHash = "sha256-JFvC9V0xS8SZSdLsOtpyTrFzXjYAOaPQaJHdcnJzK3s=";
    };
in
{
  home.packages = [
    kiti
    pkgs.swaybg
  ];
}
