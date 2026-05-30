{
  flake.modules.homeManager.shell = { pkgs, config, ... }: {
    programs.fish = {
      enable = true;
      shellAliases = {
        ls = "eza";
        ll = "eza --git -lah";
        vim = "nvim";
      };
      shellAbbrs = {
        lg = "lazygit";

        dc = "docker compose";
        cx = "chmod +x";
      };
      plugins = with pkgs.fishPlugins; [
        {
          name = "bang-bang";
          src = bang-bang.src;
        }
        {
          name = "pure";
          src = pure.src;
        }
        {
          name = "async-prompt";
          src = async-prompt.src;
        }
        {
          name = "fzf-fish";
          src = fzf-fish.src;
        }
        {
          name = "gruvbox-fish";
          src = gruvbox.src;
        }
      ];
      interactiveShellInit = ''
        theme_gruvbox dark
        set -U fish_greeting ""

        # pure prompt config
        set -g async_prompt_functions _pure_prompt_git _pure_prompt_k8s

        set -U pure_enable_single_line_prompt false
        set -U pure_check_for_new_release false
        set -U pure_enable_container_detection false
        set -U pure_enable_git true
        set -U pure_show_numbered_git_indicator true
        set -U pure_enable_k8s true
        set -U pure_enable_nixdevshell true
        set -U pure_enable_virtualenv true
        set -U pure_show_exit_status true
      '';
      functions = {
        initflake = ''nix flake init --template "https://flakehub.com/f/the-nix-way/dev-templates/*#$argv"'';
      };

    };

    programs.zoxide = {
      enable = true;
      enableFishIntegration = true;
      options = [
        "--cmd cd"
      ];
    };

    programs.eza = {
      enable = true;
      enableFishIntegration = true;
    };

    programs.fzf = {
      enable = true;
      enableFishIntegration = true;
      colors = {
        "bg+" = "#313244";
        "fg" = "#cdd6f4";
        "fg+" = "#cdd6f4";
        "header" = "#f38ba8";
        "hl" = "#f38ba8";
        "hl+" = "#f38ba8";
        "info" = "#cba6f7";
        "marker" = "#b4befe";
        "pointer" = "#f5e0dc";
        "prompt" = "#cba6f7";
        "selected-bg" = "#45475a";
        "spinner" = "#f5e0dc";
      };
    };

    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    programs.bat = {
      enable = true;
      config.theme = "gruvbox-dark";
    };

    sops.secrets.taskwarrior-config = { };
    programs.taskwarrior = {
      enable = true;
      package = pkgs.taskwarrior3;
      config = {
        sync.server.client_id = "125f47cf-db71-4da5-8371-70ea7f6c9768";
        sync.server.url = "https://task.macks.cloud";
      };
      # extraconfig includes encryption secret
      extraConfig = ''
        include ${config.sops.secrets.taskwarrior-config.path}
      '';
    };

    services.taskwarrior-sync = {
      enable = true;
      package = pkgs.taskwarrior3;
    };

    home.packages = with pkgs; [
      ncdu
      unzip
      jq
      fd
      hcloud
    ];

    programs.fastfetch.enable = true;

    programs.ripgrep.enable = true;

    programs.tealdeer.enable = true;
    programs.tealdeer.settings.updates.auto_update = true;

    programs.btop = {
      enable = true;
      settings.theme_background = false;
      settings.color_theme = "TTY";
    };
  };
}
