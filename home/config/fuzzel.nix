{ pkgs, ... }:
let
  theme  = import ./../../user/theme.nix {};
  colors = import ./../../user/colors.nix {};
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
        # Catppuccin Mocha via colors.nix (RRGGBBAA)
        background      = colors.hexA "base" 0.90;
        text            = colors.hexA "text" 1.0;
        match           = colors.hexA "red" 1.0;
        selection-match = colors.hexA "maroon" 1.0;
        selection       = colors.hexA "blue" 1.0;
        selection-text  = colors.hexA "base" 1.0;
        border          = colors.hexA "lavender" 1.0;
        prompt          = colors.hexA "lavender" 1.0;
        input           = colors.hexA "text" 1.0;
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
