{ pkgs, ... }:
let
  theme  = import ./../../user/theme.nix {};
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
        background      = "1d2021ff";
        text            = "fbf1c7ff";
        match           = "8ec07cff";
        selection-match = "1d2021ff";
        selection       = "cc241dff";
        selection-text  = "ebdbb2ff";
        border          = "cc241dff";
        prompt          = "fbf1c7ff";
        input           = "fbf1c7ff";
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
