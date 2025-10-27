{ config, lib, pkgs, ...}:
{
  services.wob = {
    enable = true;
    settings = {
      "" = {
        timeout = 500;
        anchor = "center";
        border_size = 3;
        bar_padding = 10;
        border_color = "cc241dff";
        background_color = "1d2021ff";
        bar_color = "fbf1c7ff";
      };

      "style.muted".bar_color = "cc241dff";
    };
  };
}
