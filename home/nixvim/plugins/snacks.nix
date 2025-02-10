{
  programs.nixvim.plugins.snacks = {
    enable = true;

    settings = {
      lazygit.enabled = true;
      picker.enabled = true;
    };
  };

  programs.nixvim.keymaps = [
    {
      action.__raw = "function() Snacks.lazygit() end";
      key = "<leader>gg";
      options.silent = true;
    }

    {
      action.__raw = "function() Snacks.picker.smart() end";
      key = "<leader><leader>";
      options.desc = "fuzzy find files";
    }
    {
      action.__raw = "function() Snacks.picker.buffers() end";
      key = "<leader>,";
      options.desc = "buffers";
    }
    {
      action.__raw = "function() Snacks.picker.grep() end";
      key = "<leader>/";
      options.desc = "grep";
    }
    {
      action.__raw = "function() Snacks.picker.recent() end";
      key = "<leader>fr";
      options.desc = "recent Files";
    }
    {
      action.__raw = "function() Snacks.picker.diagnostics() end";
      key = "<leader>cx";
      options.desc = "diagnostics";
    }
    {
      action.__raw = "function() Snacks.picker.lsp_symbols() end";
      key = "<leader>cs";
      options.desc = "document symbols";
    }
    {
      action.__raw = "function() Snacks.picker.lsp_workspace_symbols() end";
      key = "<leader>cS";
      options.desc = "workspace symbols";
    }
    {
      action.__raw = "function() Snacks.picker.help() end";
      key = "<leader>hh";
      options.desc = "help tags";
    }
    {
      action.__raw = "function() Snacks.picker.man() end";
      key = "<leader>hm";
      options.desc = "man pages";
    }
    {
      action.__raw = "function() Snacks.picker.lsp_references() end";
      key = "gr";
      options.desc = "lsp references";
    }
  ];
}
