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

    cmp = {
      enable = true;
      autoEnableSources = true;
      settings.sources = [
        { name = "nvim_lsp"; }
        { name = "luasnip"; }
        { name = "buffer"; }
        { name = "path"; }
      ];
      settings.mapping = {
        __raw = ''
          cmp.mapping.preset.insert({
            ['<CR>'] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Replace,
                select = false,
            }),
            ["<Up>"] = cmp.mapping.select_prev_item(),
            ["<Down>"] = cmp.mapping.select_next_item(),

            ["<C-n>"] = cmp.mapping(function(fallback)
                local has_words_before = function()
                    unpack = unpack or table.unpack
                    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                    return col ~= 0 and
                        vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
                end

                if cmp.visible() then
                    cmp.select_next_item()
                    -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
                    -- that way you will only jump inside the snippet region
                elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                elseif has_words_before() then
                    cmp.complete()
                else
                    fallback()
                end
            end, { "i", "s" }),

            ["<C-p>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, { "i", "s" }),

            ['<C-Space>'] = function(fallback)
                if cmp.visible() then
                    cmp.close()
                else
                    cmp.complete()
                end
            end,
          })
        '';
      };
    };
    luasnip.enable = true;
    friendly-snippets.enable = true;
  };
}
