{ config, lib, pkgs, ... }:
{
  services.fnott {
    enable = true;
    settings = {
      main = {
        stacking-order = "bottom-up";
        anchor = "top-right";
        icon-theme = "gruvbox-dark-icons-gtk";
        selection-helper = "fuzzel --dmenu0";
        selection-helper-uses-null-separator = true;
        play-sound = "paplay ${filename}";
        sound-file = "/usr/share/sounds/ocean/stereo/message-contact-in.oga";
        layer = "top";
        dpi-aware = "yes";
        max-timeout = 10;
        default-timeout = 5;
        title-font = "Mononoki Nerd Font:size=6";
        title-format = "";
        summary-font = "Mononoki Nerd Font:size=8";
        summary-format = "<i>%s</i>\n";
        body-font = "Mononoki Nerd Font:size=8";
        body-format = "%b";
        max-icon-size = 32;
        edge-margin-vertical = 5;
        edge-margin-horizontal = 5;
        notification-margin = 8;
        border-radius = 0;
        border-size = 3;
        padding-vertical = 18;
        padding-horizontal = 18;
        progress-bar-height = 20;
        background = "1d2021ff";
        border-color = "cc241dff";
        title-color = "fbf1c7ff";
        summary-color = "ebdbb2ff";
        body-color = "ebdbb2ff";
        progress-bar-color = "fbf1c7ff";
      };
      critical = {
        background = "1d2021ff";
        border-color = "fb4934f";
      };
    };
  };
}
