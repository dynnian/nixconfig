{ config, lib, ... }:
let
  palette = config.lib.stylix.colors;
  normalize = v: if lib.hasPrefix "#" v then v else "#${v}";
  catColors = {
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
  digits = {
    "0" = 0; "1" = 1; "2" = 2; "3" = 3; "4" = 4; "5" = 5; "6" = 6; "7" = 7; "8" = 8; "9" = 9;
    "a" = 10; "b" = 11; "c" = 12; "d" = 13; "e" = 14; "f" = 15;
  };
  hexPairToInt = pair:
    let
      hi = digits.${lib.toLower (builtins.substring 0 1 pair)};
      lo = digits.${lib.toLower (builtins.substring 1 1 pair)};
    in (hi * 16) + lo;
  hexToRgb = name:
    let hex = lib.removePrefix "#" catColors.${name};
    in {
      r = hexPairToInt (builtins.substring 0 2 hex);
      g = hexPairToInt (builtins.substring 2 2 hex);
      b = hexPairToInt (builtins.substring 4 2 hex);
    };
  hyprRgb = name:
    let rgb = hexToRgb name;
    in "rgb(${toString rgb.r},${toString rgb.g},${toString rgb.b})";
  hyprRgba = name: alpha:
    let rgb = hexToRgb name;
    in "rgba(${toString rgb.r},${toString rgb.g},${toString rgb.b},${toString alpha})";
in {
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = 2;
      gaps_out = 4;
      border_size = 3;
      resize_on_border = true;

      "col.active_border"   = hyprRgb "lavender";
      "col.inactive_border" = hyprRgb "surface0";

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
      "col.border_active"          = hyprRgba "lavender" 1.0;
      "col.border_inactive"        = hyprRgba "surface1" 1.0;
      "col.border_locked_active"   = hyprRgba "peach"    1.0;
      "col.border_locked_inactive" = hyprRgba "surface0" 1.0;

      groupbar = {
        enabled = true;
        gradients = false;
        height = 16;
        rounding = 4;

        # Opaque backgrounds so it doesn’t look transparent
        "col.active"          = hyprRgba "mantle" 1.0;
        "col.inactive"        = hyprRgba "base"   1.0;
        "col.locked_active"   = hyprRgba "peach"  1.0;
        "col.locked_inactive" = hyprRgba "surface0" 1.0;

        gaps_in = 2;
        gaps_out = 2;
        keep_upper_gap = true;
        priority = 3;
        font_size = 10;
      };
    };
  };
}
