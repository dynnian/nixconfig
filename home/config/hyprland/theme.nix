{ ... }:
let
  colors = import ./../../../user/colors.nix {};
  hex    = colors.hex;
  rgba   = name: a: colors.rgba name a;
  rgbOf  = name: let c = colors.palette.${name}.rgb;
                 in "rgb(${toString c.r},${toString c.g},${toString c.b})";
in {
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = 4;
      gaps_out = 8;
      border_size = 3;
      resize_on_border = true;

      "col.active_border"   = rgbOf "lavender";
      "col.inactive_border" = rgbOf "surface0";

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
        color = rgba "crust" 0.90;
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
