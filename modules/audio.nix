{
  flake.modules.nixos.audio = { pkgs, ... }: {
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      extraLadspaPackages = with pkgs; [
        rnnoise-plugin
        ladspaPlugins
        zam-plugins
        deepfilternet
      ];

      extraConfig.pipewire."99-mic-fx" = {
        "context.modules" = [
          {
            name = "libpipewire-module-filter-chain";
            args = {
              "node.description" = "Processed Yeti";
              "media.name" = "Processed Yeti";
              "filter.graph" = {
                nodes = [
                  {
                    type = "ladspa";
                    name = "rnnoise";
                    plugin = "librnnoise_ladspa";
                    label = "noise_suppressor_stereo";

                    control = {
                      "VAD Threshold (%)" = 50.0;
                    };
                  }
                  {
                    type = "ladspa";
                    name = "compressor";
                    plugin = "sc4_1882";
                    label = "sc4";

                    control = {
                      "RMS/peak" = 0.0;
                      "Attack time (ms)" = 15.0;
                      "Release time (ms)" = 200.0;
                      "Threshold level (dB)" = -18.0;
                      "Ratio (1:n)" = 3.0;
                      "Knee radius (dB)" = 3.25;
                      "Makeup gain (dB)" = 3.0;
                    };
                  }
                  {
                    type = "ladspa";
                    name = "gate";
                    plugin = "ZamGateX2-ladspa";
                    label = "ZamGateX2";

                    control = {
                      "Attack" = 5.0;
                      "Release" = 250.0;
                      "Threshold" = -50.0;
                      "Makeup" = 0.0;
                      "Sidechain" = 0.0;
                      "Max gate close" = -12.0;
                      "Mode open/shut" = 0.0;
                    };
                  }
                  {
                    type = "ladspa";
                    name = "deepfilter";
                    plugin = "libdeep_filter_ladspa";
                    label = "deep_filter_stereo";

                    control = {
                      "Attenuation Limit (dB)" = 24.0;
                      "Min processing threshold (dB)" = -15.0;
                      "Max ERB processing threshold (dB)" = 35.0;
                      "Max DF processing threshold (dB)" = 35.0;
                      "Min Processing Buffer (frames)" = 0.0;
                      "Post Filter Beta" = 0.0;
                    };
                  }
                ];
                links = [
                  {
                    output = "rnnoise:Output (L)";
                    input = "deepfilter:Audio In L";
                  }
                  {
                    output = "rnnoise:Output (R)";
                    input = "deepfilter:Audio In R";
                  }
                  {
                    output = "deepfilter:Audio Out L";
                    input = "gate:Audio Input 1";
                  }
                  {
                    output = "deepfilter:Audio Out R";
                    input = "gate:Audio Input 2";
                  }
                  {
                    output = "gate:Audio Output 1";
                    input = "compressor:Left input";
                  }
                  {
                    output = "gate:Audio Output 2";
                    input = "compressor:Right input";
                  }
                ];
                inputs = [
                  "rnnoise:Input (L)"
                  "rnnoise:Input (R)"
                ];
                outputs = [
                  "compressor:Left output"
                  "compressor:Right output"
                ];
              };

              "capture.props" = {
                "node.name" = "capture.blue_yeti_fx";
                "node.passive" = true;
              };

              "playback.props" = {
                "node.name" = "blue_yeti_fx";
                "node.description" = "Processed Yeti";
                "media.class" = "Audio/Source";
                "audio.position" = [ "FL" "FR" ];
              };
            };
          }
        ];
      };
    };

    environment.systemPackages = [
      pkgs.pavucontrol
      pkgs.pamixer
    ];
    users.users.max.extraGroups = [
      "audio"
      "pipewire"
    ];
  };
}
