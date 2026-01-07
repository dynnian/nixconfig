{ ... }: {
  programs.nixvim.plugins.bufferline = {
    enable = true;

    settings = {
      options = {
        separator_style = [ "" "" ];
        indicator = { style = "none"; };
        tab_size = 18;
        show_close_icon = false;          # global close on the far right
        show_buffer_close_icons = true;   # per-tab close icon
        buffer_close_icon = "";
        close_icon = "";
        modified_icon = "";
        left_mouse_command = "buffer %d";     # click tab = go to buffer
        middle_mouse_command = "lua require('mini.bufremove').delete(%d, false)";  # middle click = close
        right_mouse_command = "lua require('mini.bufremove').delete(%d, true)";  # right click = force close
        close_command = "lua require('mini.bufremove').delete(%d, false)";
        offsets = [
          {
            filetype = "neo-tree";
            text = "Explorer";
            highlight = "Directory";
            separator = true;
          }
        ];
      };
    };
  };
}
