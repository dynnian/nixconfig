{ config, lib, pkgs, ... }:
let
  palette = config.lib.stylix.colors;
  normalize = v: if lib.hasPrefix "#" v then v else "#${v}";
  hex = {
    rosewater = normalize palette.base06;
    flamingo = normalize palette.base0F;
    pink = normalize palette.base0F;
    mauve = normalize palette.base0E;
    red = normalize palette.base08;
    maroon = normalize palette.base0F;
    peach = normalize palette.base09;
    yellow = normalize palette.base0A;
    green = normalize palette.base0B;
    teal = normalize palette.base0C;
    sky = normalize palette.base0D;
    sapphire = normalize palette.base0D;
    blue = normalize palette.base0D;
    lavender = normalize palette.base07;
    text = normalize palette.base05;
    subtext1 = normalize palette.base07;
    subtext0 = normalize palette.base06;
    overlay2 = normalize palette.base04;
    overlay1 = normalize palette.base03;
    overlay0 = normalize palette.base02;
    surface2 = normalize palette.base04;
    surface1 = normalize palette.base03;
    surface0 = normalize palette.base02;
    base = normalize palette.base00;
    mantle = normalize palette.base01;
    crust = normalize palette.base00;
  };
in {
  programs.kitty = {
    enable = true;
    package = pkgs.kitty;

    settings = {
      cursor_shape = "underline";
      cursor_underline_thickness = 3.0;

      # theme fonts
      font_family       = config.stylix.fonts.monospace.name;
      bold_font         = "auto";
      italic_font       = "auto";
      bold_italic_font  = "auto";
      font_size         = config.stylix.fonts.sizes.applications;

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
