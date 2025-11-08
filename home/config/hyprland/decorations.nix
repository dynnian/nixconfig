{ ... }:
let
  colors = import ./../../../user/colors.nix {};
in {
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = 2;
      gaps_out = 4;
      border_size = 3;
      resize_on_border = true;

      "col.active_border"   = colors.hypr.rgb "lavender";
      "col.inactive_border" = colors.hypr.rgb "surface0";

      layout = "master";
      no_focus_fallback = true;
    };

    decoration = {
      rounding = 0;
      dim_special = 0.5;
      blur = {
        special = true;
        enabled = true;
        size = 4;
        passes = 2;
        new_optimizations = true;
        noise = 0.2;
        brightness = 0.8;
      };
      shadow = {
        enabled = true;
        color = colors.hypr.rgba "crust" 0.90;
        range = 5;
        render_power = 3;
      };
    };

    layerrule = [
      "blur, waybar"
      "blur, launcher"
      "blur, notifications"
    ];

    group = {
      # Group border (outline around the whole group)
      "col.border_active"         = colors.hypr.rgba "lavender";   # active group
      "col.border_inactive"       = colors.hypr.rgba "surface1";   # inactive group
      "col.border_locked_active"  = colors.hypr.rgba "peach";      # if you lock groups
      "col.border_locked_inactive"= colors.hypr.rgba "surface0";

      groupbar = {
        enabled = true;
        gradients = false; # keep it flat; set true for gradients
        height = 16;
        rounding = 4;
        text_color = colors.hypr.rgb "text";
        text_color_inactive = colors.hypr.rgb "overlay2";

        # Background behind the tabs (make opaque to avoid transparency)
        "col.active"           = colors.hypr.rgba "mantle";   # active tab bg
        "col.inactive"         = colors.hypr.rgba "base";     # inactive tab bg
        "col.locked_active"    = colors.hypr.rgba "peach";
        "col.locked_inactive"  = colors.hypr.rgba "surface0";

        gaps_in = 2;
        gaps_out = 2;
        keep_upper_gap = true;             # show a top gap above the groupbar
        priority = 3;                      # raise if it renders behind other decos
        font_family = "Inter";             # or your preferred font
        font_size = 9;
      };
    };
  };
}
