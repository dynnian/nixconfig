{ ... }: {
  programs.nixvim.plugins.bufferline = {
    enable = true;
    settings = {
      options = {
        separator_style = "slant";
        diagnostics = "nvim_lsp";
        always_show_bufferline = true;
        show_close_icon = false;
        show_buffer_close_icons = false;
      };
      highlights = {
        fill.bg = "NONE";
        background.bg = "NONE";

        buffer_visible = {
          bg = "NONE";
        };
        buffer_selected = {
          bg = "NONE";
        };

        tab.bg = "NONE";
        tab_selected.bg = "NONE";
        tab_separator.bg = "NONE";
        tab_separator_selected.bg = "NONE";

        separator.bg = "NONE";
        separator_visible.bg = "NONE";
        separator_selected.bg = "NONE";

        close_button.bg = "NONE";
        close_button_visible.bg = "NONE";
        close_button_selected.bg = "NONE";

        modified.bg = "NONE";
        modified_visible.bg = "NONE";
        modified_selected.bg = "NONE";
      };
    };
  };
}
