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
    };
  };
}
