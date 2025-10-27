{ config, lib, pkgs, ... }: {
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "Mononoki Nerd Font:size=12";
        dpi-aware = "no";
        prompt = " ";
        icon-theme = "gruvbox-dark-icons-gtk";
        icons-enabled = "yes";
        password-character = "*";
        terminal = "foot";
        lines = 20;
        width = 70;
        inner-pad = 12;
        vertical-pad = 24;
        horizontal-pad = 32;
        layer = "top";
        exit-on-keyboard-focus-loss = "yes";
      };
      colors = {
        background = "1d2021ff";
        text = "fbf1c7ff";
        match = "8ec07cff";
        selection-match = "1d2021ff";
        selection = "cc241dff";
        selection-text = "ebdbb2ff";
        border = "cc241dff";
        prompt = "fbf1c7ff";
        input = "fbf1c7ff";
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
