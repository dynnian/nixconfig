{ config, lib, pkgs, ... }:
{
  programs.fuzzel = {
    enable = true;
    package = pkgs.fuzzel;

    settings = {
      main = {
        dpi-aware = "no";
        prompt = "\" \"";
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
