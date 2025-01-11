{
  programs.nixvim = {
    plugins.telescope = {
      enable = true;
      keymaps = {
        "<leader>," = "buffers";
        "<leader>/" = "grep_string";
        "<leader>fr" = "oldfiles";
        "<leader>ff" = "file_browser";
        "<leader>cx" = "diagnostics";
        "<leader>cs" = "lsp_document_symbols";
        "<leader>cS" = "lsp_workspace_symbols";
        "<leader>hh" = "help_tags";
        "<leader>hm" = "man_pages";
      };

      extensions.fzf-native.enable = true;
      extensions.file-browser.enable = true;
    };
    keymaps = [
      {
        action.__raw = ''
          function()
              builtin = require("telescope.builtin")
              is_inside_work_tree = {}

              local cwd = vim.fn.getcwd()
              if is_inside_work_tree[cwd] == nil then
                  vim.fn.system("git rev-parse --is-inside-work-tree")
                  is_inside_work_tree[cwd] = vim.v.shell_error == 0
              end

              if is_inside_work_tree[cwd] then
                  builtin.git_files({ show_untracked = true })
              else
                  builtin.find_files({})
              end
          end
        '';
        key = "<leader><leader>";
        options.desc = "Fuzzy find files";
      }
    ];
  };
}

