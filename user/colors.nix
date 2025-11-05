# colors.nix — Catppuccin Mocha palette with helpers for HEX, RGB/A, and HSL
{ }:

let
  # --- Full Catppuccin Mocha palette (hex, rgb, hsl) ---
  palette = {
    rosewater = { hex = "#f5e0dc"; rgb = { r = 245; g = 224; b = 220; }; hsl = { h = 10;  s = 56; l = 91; }; };
    flamingo  = { hex = "#f2cdcd"; rgb = { r = 242; g = 205; b = 205; }; hsl = { h = 0;   s = 59; l = 86; }; };
    pink      = { hex = "#f5c2e7"; rgb = { r = 245; g = 194; b = 231; }; hsl = { h = 316; s = 72; l = 86; }; };
    mauve     = { hex = "#cba6f7"; rgb = { r = 203; g = 166; b = 247; }; hsl = { h = 267; s = 84; l = 81; }; };
    red       = { hex = "#f38ba8"; rgb = { r = 243; g = 139; b = 168; }; hsl = { h = 343; s = 81; l = 75; }; };
    maroon    = { hex = "#eba0ac"; rgb = { r = 235; g = 160; b = 172; }; hsl = { h = 350; s = 65; l = 79; }; };
    peach     = { hex = "#fab387"; rgb = { r = 250; g = 179; b = 135; }; hsl = { h = 23;  s = 92; l = 75; }; };
    yellow    = { hex = "#f9e2af"; rgb = { r = 249; g = 226; b = 175; }; hsl = { h = 41;  s = 86; l = 83; }; };
    green     = { hex = "#a6e3a1"; rgb = { r = 166; g = 227; b = 161; }; hsl = { h = 115; s = 54; l = 76; }; };
    teal      = { hex = "#94e2d5"; rgb = { r = 148; g = 226; b = 213; }; hsl = { h = 170; s = 57; l = 72; }; };
    sky       = { hex = "#89dceb"; rgb = { r = 137; g = 220; b = 235; }; hsl = { h = 189; s = 71; l = 73; }; };
    sapphire  = { hex = "#74c7ec"; rgb = { r = 116; g = 199; b = 236; }; hsl = { h = 199; s = 76; l = 69; }; };
    blue      = { hex = "#89b4fa"; rgb = { r = 137; g = 180; b = 250; }; hsl = { h = 217; s = 92; l = 76; }; };
    lavender  = { hex = "#b4befe"; rgb = { r = 180; g = 190; b = 254; }; hsl = { h = 232; s = 97; l = 85; }; };

    text      = { hex = "#cdd6f4"; rgb = { r = 205; g = 214; b = 244; }; hsl = { h = 226; s = 64; l = 88; }; };
    subtext1  = { hex = "#bac2de"; rgb = { r = 186; g = 194; b = 222; }; hsl = { h = 227; s = 35; l = 80; }; };
    subtext0  = { hex = "#a6adc8"; rgb = { r = 166; g = 173; b = 200; }; hsl = { h = 228; s = 24; l = 72; }; };

    overlay2  = { hex = "#9399b2"; rgb = { r = 147; g = 153; b = 178; }; hsl = { h = 228; s = 17; l = 64; }; };
    overlay1  = { hex = "#7f849c"; rgb = { r = 127; g = 132; b = 156; }; hsl = { h = 230; s = 13; l = 55; }; };
    overlay0  = { hex = "#6c7086"; rgb = { r = 108; g = 112; b = 134; }; hsl = { h = 231; s = 11; l = 47; }; };

    surface2  = { hex = "#585b70"; rgb = { r = 88;  g = 91;  b = 112; }; hsl = { h = 233; s = 12; l = 39; }; };
    surface1  = { hex = "#45475a"; rgb = { r = 69;  g = 71;  b = 90;  }; hsl = { h = 234; s = 13; l = 31; }; };
    surface0  = { hex = "#313244"; rgb = { r = 49;  g = 50;  b = 68;  }; hsl = { h = 236; s = 16; l = 23; }; };

    base      = { hex = "#1e1e2e"; rgb = { r = 30;  g = 30;  b = 46;  }; hsl = { h = 240; s = 21; l = 15; }; };
    mantle    = { hex = "#181825"; rgb = { r = 24;  g = 24;  b = 37;  }; hsl = { h = 240; s = 21; l = 12; }; };
    crust     = { hex = "#11111b"; rgb = { r = 17;  g = 17;  b = 27;  }; hsl = { h = 240; s = 23; l = 9;  }; };
  };

  # --- Base helpers (keep existing API) ---
  toHex = name: palette.${name}.hex;
  toHsl = name: let h = palette.${name}.hsl;
                in "hsl(${toString h.h}deg, ${toString h.s}%, ${toString h.l}%)";
  rgba  = name: alpha:
    let c = palette.${name}.rgb;
    in "rgba(${toString c.r}, ${toString c.g}, ${toString c.b}, ${toString alpha})";

  # --- New helpers ---
  # CSS-style strings (with spaces)
  cssRgb  = name: let c = palette.${name}.rgb;
                  in "rgb(${toString c.r}, ${toString c.g}, ${toString c.b})";
  cssRgba = name: a: let c = palette.${name}.rgb;
                     in "rgba(${toString c.r}, ${toString c.g}, ${toString c.b}, ${toString a})";

  # Hyprland-style strings (no spaces)
  hyprRgb  = name: let c = palette.${name}.rgb;
                   in "rgb(${toString c.r},${toString c.g},${toString c.b})";
  hyprRgba = name: a: let c = palette.${name}.rgb;
                      in "rgba(${toString c.r},${toString c.g},${toString c.b},${toString a})";

  # Hex without '#'
  noHash = s: builtins.substring 1 (builtins.stringLength s - 1) s;

  # RRGGBBAA (for fuzzel, etc.)
  # NOTE: requires a lib with toHexString; we can inline a tiny pad here.
  toHexA = name: a:
    let
      base = noHash (toHex name);
      ai   = builtins.floor (a * 255.0);
      ah   = builtins.toString (builtins.elemAt
              (map (x: builtins.elemAt "0123456789abcdef" (x)))
              []); # placeholder to keep syntax; we'll build hex below
      hexByte = n:
        let
          digits = "0123456789abcdef";
          hi = builtins.floor (n / 16);
          lo = n - (hi * 16);
        in "${builtins.substring hi 1 digits}${builtins.substring lo 1 digits}";
      aa = hexByte ai;
    in "${base}${aa}";
in
{
  inherit palette toHex toHsl rgba;

  # quick maps
  hex = builtins.mapAttrs (_: v: v.hex) palette;
  hsl = builtins.mapAttrs (_: v: "hsl(${toString v.hsl.h}deg, ${toString v.hsl.s}%, ${toString v.hsl.l}%)") palette;
  rgb = builtins.mapAttrs (_: v: v.rgb) palette;

  # expose new helpers
  css  = { rgb = cssRgb; rgba = cssRgba; };
  hypr = { rgb = hyprRgb; rgba = hyprRgba; };
  hexA = toHexA;   # -> "RRGGBBAA" without '#'
}
