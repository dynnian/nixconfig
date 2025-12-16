{ ... }:
let
  theme = import ./../../../user/theme.nix {};
  color_normal_white  = "#a89984";
  color_bright_white  = "#ebdbb2";
  color_normal_gray   = "#282828";
  color_bright_gray   = "#665c54";
  color_bright_yellow = "#d79921";
  color_normal_black  = "#1d2021";
  color_unused        = "#ff0000";
  color_normal_red    = "#cc241d";
  color_normal_teal   = "#689d6a";
  color_normal_green  = "#98971a";
in {
  wayland.windowManager.sway = {
    config = {
      fonts = {
        names = [ "${theme.font-mono}" ];
        size = theme.font-size;
      };

      colors = {
        focused = {
          border      = color_normal_red;
          background  = color_bright_gray;
          text        = color_bright_white;
          indicator   = color_normal_teal;
          childBorder = color_normal_red;
        };

        focusedInactive = {
          border      = color_bright_gray;
          background  = color_bright_gray;
          text        = color_bright_white;
          indicator   = color_normal_green;
          childBorder = color_bright_gray;
        };

        unfocused = {
          border      = color_bright_gray;
          background  = color_normal_gray;
          text        = color_normal_white;
          indicator   = color_normal_green;
          childBorder = color_bright_gray;
        };

        urgent = {
          border      = color_bright_yellow;
          background  = color_bright_yellow;
          text        = color_normal_black;
          indicator   = color_unused;
          childBorder = color_unused;
        };

        placeholder = {
          border      = color_unused;
          background  = color_unused;
          text        = color_unused;
          indicator   = color_unused;
          childBorder = color_unused;
        };

        background = color_normal_black;
      };

      # Window borders
      window.border = 3;
      floating.border = 3;

      gaps = {
        inner = 5;
        smartBorders = false;
      };
    };
  };
}
