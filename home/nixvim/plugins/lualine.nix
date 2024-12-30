{
  programs.nixvim.plugins.lualine = {
    enable = true;
    settings = {
      options = {
        component_separators.left = "";
        component_separators.right = "";
        section_separators.left = "";
        section_separators.right = "";
      };
      sections = {
        lualine_a = [ "mode" ];
        lualine_b = [ "diagnostics" ];
        lualine_c = [ "buffers" ];
        lualine_x = [];
        lualine_y = [ "branch" "diff" ];
        lualine_z = [ "location" "selectioncount" ];
      };
    };
  };
}
