{ config, pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    package = pkgs.kitty;

    settings = {
      cursor_shape = "underline";
      cursor_underline_thickness = 3.0;

      shell = "fish";
      confirm_os_window_close = 0;

      # layout preferences (colors come from Stylix)
      window_margin_width = 5;
      wayland_titlebar_color = "system";
      macos_titlebar_color   = "system";
    };
  };
}
