{ pkgs, ... }:
let
  theme  = import ./../../user/theme.nix {};
  colors = import ./../../user/colors.nix {};
  hex    = colors.hex;
in {
  programs.kitty = {
    enable = true;
    package = pkgs.kitty;

    settings = {
      cursor_shape = "underline";
      cursor_underline_thickness = 3.0;

      # theme fonts
      font_family       = "${theme.font-mono}";
      bold_font         = "auto";
      italic_font       = "auto";
      bold_italic_font  = "auto";
      font_size         = theme.font-size;

      shell = "fish";
      confirm_os_window_close = 0;

      # opacity is separate in kitty; keep colors opaque and control translucency here
      background_opacity = 0.90;

      window_margin_width = 5;
      wayland_titlebar_color = "system";
      macos_titlebar_color   = "system";

      # --- Colors ---

      # core
      foreground            = hex.text;
      background            = hex.base;
      selection_foreground  = hex.base;
      selection_background  = hex.rosewater;

      # cursor
      cursor            = hex.rosewater;
      cursor_text_color = hex.base;

      # links
      url_color = hex.rosewater;

      # borders
      active_border_color   = hex.lavender;
      inactive_border_color = hex.overlay0;
      bell_border_color     = hex.yellow;

      # tab bar
      active_tab_foreground   = hex.crust;
      active_tab_background   = hex.mauve;
      inactive_tab_foreground = hex.text;
      inactive_tab_background = hex.mantle;
      tab_bar_background      = hex.crust;

      # marks
      mark1_foreground = hex.base;
      mark1_background = hex.lavender;
      mark2_foreground = hex.base;
      mark2_background = hex.mauve;
      mark3_foreground = hex.base;
      mark3_background = hex.sapphire;

      # 16-color palette
      # black
      color0  = hex.surface1;
      color8  = hex.surface2;
      # red
      color1  = hex.red;
      color9  = hex.red;
      # green
      color2  = hex.green;
      color10 = hex.green;
      # yellow
      color3  = hex.yellow;
      color11 = hex.yellow;
      # blue
      color4  = hex.blue;
      color12 = hex.blue;
      # magenta
      color5  = hex.pink;
      color13 = hex.pink;
      # cyan
      color6  = hex.teal;
      color14 = hex.teal;
      # white
      color7  = hex.subtext1;
      color15 = hex.subtext0;
    };
  };
}
