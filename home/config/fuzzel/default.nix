{ pkgs, ... }:
let
  theme = import ./../../../user/theme.nix {};
in {
  programs.fuzzel = {
    enable = true;
    package = pkgs.fuzzel;
    settings = {
      main = {
        font = "${theme.font-mono}:size=${toString theme.font-size}";
        dpi-aware = "no";
        prompt = "  ";
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
        background = "1e1e2eff";
        text = "cdd6f4ff";
        match = "e78284ff";
        selection-match = "e64553ff";
        selection = "89b4faff";
        selection-text = "1e1e2eff";
        border = "89b4faff";
        prompt = "89b4faff";
        input = "cdd6f4ff";
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
