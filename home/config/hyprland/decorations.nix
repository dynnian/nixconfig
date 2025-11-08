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
  };
}
