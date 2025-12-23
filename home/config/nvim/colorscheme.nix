{ ... }: {
  programs.nixvim = {
    colorschemes.gruvbox = {
      enable = true;
      settings = {
        undercurl = true;
        underline = true;
        bold = true;
        italic = {
          strings = true;
          emphasis = true;
          comments = true;
          operators = false;
          folds = true;
        };
        strikethrough = true;
        invert_selection = false;
        invert_signs = false;
        invert_tabline = false;
        inverse = true;
        dim_inactive = false;
        transparent_mode = false;
      };
    };
  };
}
