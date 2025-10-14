{ pkgs, ... }:
let
  sdrpp-slim = pkgs.sdrpp.override {
    airspy_source = false;
    airspyhf_source = false;
    bladerf_source = false;
    hackrf_source = false;
    limesdr_source = false;
    plutosdr_source = false;
    rfspace_source = false;
    soapy_source = false;
    spyserver_source = false;
  };
in
{
  home.packages = with pkgs;
    [
      sdrpp-slim
      chirp
    ];
}

