{
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      inlayHints = true;

      servers = {
        basedpyright.enable = true;
        nixd.enable = true;
      };
    };
  };
}
