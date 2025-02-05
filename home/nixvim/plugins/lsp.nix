{
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      inlayHints = true;

      keymaps = {
        lspBuf = {
          K = "hover";
          gd = "definition";
          gD = "declaration";
          gi = "implementation";
          go = "type_definition";
          gs = "signature_help";
          "<leader>ca" = "code_action";
          "<leader>cr" = "rename";
        };
        diagnostic = {
          "<leader>cd" = "open_float";
        };
      };

      servers = {
        basedpyright.enable = true;

        nixd.enable = true;
        nixd.settings.formatting.command = [ "nixpkgs-fmt" ];

        yamlls.enable = true;
      };
    };

    lsp-format.enable = true;

    blink-cmp = {
      enable = true;
      settings = {
        sources.default = [ "lsp" "path" "snippets" "buffer" ];
        signature.enabled = true;
        completion.list.selection = {
          auto_insert = true;
          preselect = false;
        };

        keymap = {
          preset = "default";
          "<C-Space>" = [ "show" "hide" "fallback" ];
          "<CR>" = [ "accept" "fallback" ];
          "<Down>" = [ "select_next" "fallback" ];
          "<Up>" = [ "select_prev" "fallback" ];
          "<C-n>" = [ "snippet_forward" "select_next" "fallback" ];
          "<C-p>" = [ "snippet_backward" "select_prev" "fallback" ];
          "<C-u>" = [ "scroll_documentation_up" "fallback" ];
          "<C-d>" = [ "scroll_documentation_down" "fallback" ];
        };
      };
    };

    luasnip.enable = true;
    friendly-snippets.enable = true;
  };
}
