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

      "col.active_border"   = colors.hypr.rgb  "lavender";
      "col.inactive_border" = colors.hypr.rgb  "surface0";

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
        color = colors.hypr.rgba "crust" 0.90;   # you already pass alpha here ✔
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
      # Give RGBA *with* alpha (or use rgb for opaque)
      "col.border_active"          = colors.hypr.rgba "lavender" 1.0;
      "col.border_inactive"        = colors.hypr.rgba "surface1" 1.0;
      "col.border_locked_active"   = colors.hypr.rgba "peach"    1.0;
      "col.border_locked_inactive" = colors.hypr.rgba "surface0" 1.0;

      groupbar = {
        enabled = true;
        gradients = false;
        height = 16;
        rounding = 4;

        # Opaque backgrounds so it doesn’t look transparent
        "col.active"          = colors.hypr.rgba "mantle" 1.0;
        "col.inactive"        = colors.hypr.rgba "base"   1.0;
        "col.locked_active"   = colors.hypr.rgba "peach"  1.0;
        "col.locked_inactive" = colors.hypr.rgba "surface0" 1.0;

        gaps_in = 2;
        gaps_out = 2;
        keep_upper_gap = true;
        priority = 3;
        font_size = 10;
      };
    };
  };
}
