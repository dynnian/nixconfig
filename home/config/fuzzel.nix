{ pkgs, ... }:
let
  theme  = import ./../../user/theme.nix {};
  colors = import ./../../user/colors.nix {};
  hex    = colors.hex;
  lib    = pkgs.lib;

  # strip leading '#'
  noHash = s: builtins.substring 1 (builtins.stringLength s - 1) s;

  # Build RRGGBBAA for fuzzel (alpha = 0.0..1.0)
  hexA = name: a:
    let
      base = noHash hex.${name};
      ai   = builtins.floor (a * 255);
      ah   = lib.toHexString ai;
      aa   = if builtins.stringLength ah == 1 then "0${ah}" else ah;  # pad
    in "${base}${aa}";
in {
  programs.fuzzel = {
    enable = true;
    package = pkgs.fuzzel;

    settings = {
      main = {
        font   = "${theme."font-mono"}:size=${toString theme."font-size"}";
        dpi-aware = "no";
        prompt   = "\" \"";
        icon-theme = "${theme.icon}";
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
        # Colors via colors.nix
        background         = hexA "base" 0.90;
        text               = hexA "text" 1.0;
        match              = hexA "red"  1.0;
        selection-match    = hexA "maroon" 1.0;
        selection          = hexA "blue" 1.0;
        selection-text     = hexA "base" 1.0;
        border             = hexA "lavender" 1.0;
        prompt             = hexA "lavender" 1.0;
        input              = hexA "text" 1.0;
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
