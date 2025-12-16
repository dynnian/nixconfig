{ pkgs, ... }:
let
  bg        = "1d2021";
  fg        = "fbf1c7";
  red       = "cc241d";
  yellow    = "d79921";
  blue      = "458588";
  purple    = "b16286";
  aqua      = "689d6a";
  bgA       = "1d2021cc";
  theme = import ./../../../user/theme.nix {};
in {
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock;

    settings = {
      color = bgA;
      indicator-radius = 90;
      indicator-thickness = 8;
      font = "${theme.font}";
      font-size = theme.font-size;
      text-color = fg;
      inside-color = bg;
      ring-color = blue;
      line-color = blue;
      separator-color = bg;
      key-hl-color = yellow;
      inside-clear-color = bg;
      ring-clear-color = aqua;
      text-clear-color = aqua;
      line-clear-color = aqua;
      inside-ver-color = bg;
      ring-ver-color = yellow;
      text-ver-color = yellow;
      line-ver-color = yellow;
      inside-wrong-color = bg;
      ring-wrong-color = red;
      text-wrong-color = red;
      line-wrong-color = red;
      inside-caps-lock-color = bg;
      ring-caps-lock-color = purple;
      text-caps-lock-color = purple;
      line-caps-lock-color = purple;
      show-failed-attempts = true;
      ignore-empty-password = true;
    };
  };
}
