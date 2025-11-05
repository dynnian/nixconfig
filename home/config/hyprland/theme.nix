{ ... }:
let
  colors = import ./../../../user/colors.nix {};
  hex    = colors.hex;
  rgba   = name: a: colors.rgba name a;
in {
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = 4;
      gaps_out = 8;
      border_size = 3;
      resize_on_border = true;

      # Use Catppuccin Mocha colors dynamically
      "col.active_border"   = "rgb(${colors.palette.blue.rgb.r}, ${colors.palette.blue.rgb.g}, ${colors.palette.blue.rgb.b})";
      "col.inactive_border" = "rgb(${colors.palette.surface0.rgb.r}, ${colors.palette.surface0.rgb.g}, ${colors.palette.surface0.rgb.b})";

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
        # Use slightly transparent shadow
        color = ${rgba "crust" 0.90};
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
