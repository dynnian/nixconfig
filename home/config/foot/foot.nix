{ config, pkgs, ... }:
{
  programs.foot.enable = true;

  programs.foot.settings = {
    main = {
      shell = fish;
      font = "Mononoki Nerd Font:size=12";
      initial-window-size-chars = "140x35";
      pad = "8x8";
    };
    scrollback = {
      lines = 10000;
    };
    url = {
      launch = "xdg-open \${url}";
    };
    cursor = {
      style = "underline";
      blink = "yes";
    };
    colors = {
      alpha = 0.95;
      background = "1d2021";
      foreground = "fbf1c7";
      regular0 = "282828";
      regular1 = "cc241d";
      regular2 = "98971a";
      regular3 = "d79921";
      regular4 = "458588";
      regular5 = "b16286";
      regular6 = "689d6a";
      regular7 = "a89984";
      bright0 = "928374";
      bright1 = "fb4934";
      bright2 = "b8bb26";
      bright3 = "fabd2f";
      bright4 = "83a598";
      bright5 = "d3869b";
      bright6 = "8ec07c";
      bright7 = "ebdbb2";
    };
  };
}
