{ pkgs, ... }:
let
  theme = import ./../../user/theme.nix {};
in
{
  services.mako = {
    enable = true;
    package = pkgs.mako;
    settings = {
      max-history = 5;
      sort = "+time";

      # Binding options
      on-button-left = "dismiss";
      on-button-right = "dismiss-all";

      # Style options
      font = "${theme.font-mono} ${toString theme.font-size}";
      width = 450;
      height = 130;
      margin = 10;
      padding = 15;
      border-size = 3;
      border-radius = 10;
      icons = true;
      max-icon-size = 32;
      icon-location = "left";
      markup = true;
      actions = true;
      history = true;
      text-alignment = "left";
      default-timeout = 15000;
      layer = "top";
      anchor = "top-right";
      # Colors
      background-color = "#1e1e2e";
      text-color = "#cdd6f4";
      border-color = "#b4befe";
      progress-color = "over #313244";

      "urgency=high" = {
        border-color = "#fab387";
      };

      "category=CHANGE_LAYOUT" = {
        font = "${theme.font-mono} ${toString theme.font-size-alt}";
        background-color = "#1e1e2e";
        text-color = "#cdd6f4";
        border-color = "#b4befe";
        width = 300;
        height = 100;
        margin = 300;
        padding = 15;
        border-size = 3;
        history = 0;
        text-alignment = "center";
        layer = "top";
        default-timeout = 400;
        anchor = "top-center";
      };
    };
  };
}
