{
  programs.nixvim = {
    plugins.noice = {
      enable = true;

      settings = {
        lsp = {
          "vim.lsp.util.convert_input_to_markdown_lines" = true;
          "vim.lsp.util.stylize_markdown" = true;
          "cmp.entry.get_documentation" = true;
          hover.enabled = true;
          signature.enabled = false;
        };

        presets = {
          long_message_to_split = true;
          lsp_doc_border = true;
        };
      };
    };
    keymaps = [
      {
        action = "<cmd>NoiceHistory<cr>";
        key = "<leader>hn";
        options.desc = "Noice History";
      }
    ];
  };
}
