{ config, lib, pkgs, ... }:
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
  hexA = name: alpha:
    let
      base = lib.removePrefix "#" catColors.${name};
      n = builtins.floor (alpha * 255);
      digits = "0123456789abcdef";
      hi = builtins.substring (builtins.floor (n / 16)) 1 digits;
      lo = builtins.substring (n - (builtins.floor (n / 16) * 16)) 1 digits;
    in "#${base}${hi}${lo}";
in {
  programs.fuzzel = {
    enable = true;
    package = pkgs.fuzzel;

    settings = {
      main = {
        font   = "${config.stylix.fonts.monospace.name}:size=${toString config.stylix.fonts.sizes.applications}";
        dpi-aware = "no";
        prompt   = "\" \"";
        icon-theme = "${config.stylix.iconTheme.name}";
        icons-enabled = "yes";
        password-character = "*";
        terminal = "kitty";
        lines = 20;
        width = 70;
        inner-pad = 12;
        vertical-pad = 24;
        horizontal-pad = 32;
        layer = "top";
        exit-on-keyboard-focus-loss = "yes";
      };

      colors = {
        background      = hexA "base" 0.90;
        text            = hexA "text" 1.0;
        match           = hexA "red" 1.0;
        selection-match = hexA "maroon" 1.0;
        selection       = hexA "blue" 1.0;
        selection-text  = hexA "base" 1.0;
        border          = hexA "lavender" 1.0;
        prompt          = hexA "lavender" 1.0;
        input           = hexA "text" 1.0;
      };

      border = {
        width = 3;
        radius = 0;
      };

      dmenu = {
        mode = "text";
        exit-immediately-if-empty = "no";
      };
    };
  };
}
