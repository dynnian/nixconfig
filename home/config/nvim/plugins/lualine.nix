{ ... }: {
  programs.nixvim.plugins.lualine = {
    enable = true;

    settings = {
      options = {
        # Powerline look
        theme = "gruvbox";
        component_separators = { left = ""; right = ""; };
        section_separators   = { left = ""; right = ""; };

        globalstatus = true;
        icons_enabled = true;
      };

      sections = {
        lualine_a = [ "mode" ];
        lualine_b = [ "branch" "diff" ];
        lualine_c = [ "filename" ];

        lualine_x = [ "diagnostics" "encoding" "fileformat" "filetype" ];
        lualine_y = [ "progress" ];
        lualine_z = [ "location" ];
      };
    };
  };
}
