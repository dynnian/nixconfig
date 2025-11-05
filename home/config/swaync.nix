{ config, ... }:
let
  theme  = import ./../../user/theme.nix {};
  colors = import ./../../user/colors.nix {};
  hex    = colors.hex;
  rgba   = name: a: colors.rgba name a;
in {
  services.swaync = {
    enable = true;
    settings = {
      positionX = "right";
      positionY = "top";
      layer = "overlay";
      control-center-margin-top = 10;
      control-center-margin-bottom = 10;
      control-center-margin-right = 10;
      control-center-margin-left = 10;
      notification-icon-size = 64;
      notification-body-image-height = 100;
      notification-body-image-width = 200;
      timeout = 10;
      timeout-low = 5;
      timeout-critical = 0;
      fit-to-screen = false;
      control-center-width = 500;
      control-center-height = 1025;
      notification-window-width = 500;
      keyboard-shortcuts = true;
      image-visibility = "when-available";
      transition-time = 200;
      hide-on-clear = false;
      hide-on-action = true;
      script-fail-notify = true;
      widget-config = {
        title = {
          text = "Notification Center";
          clear-all-button = true;
          button-text = "󰆴 Clear All";
        };
        dnd = {
          text = "Do Not Disturb";
        };
        label = {
          max-lines = 1;
          text = "Notification Center";
        };
        mpris = {
          image-size = 96;
          image-radius = 7;
          autohide = true;
          blacklist = [ "playerctld" ];
        };
        volume = { label = "󰕾"; };
        backlight = { label = "󰃟"; };
      };
      widgets = [ "title" "mpris" "volume" "backlight" "dnd" "notifications" ];
    };

    style = ''
      * {
        font-family: ${theme.font-mono};
        font-weight: bold;
      }

      .control-center .notification-row:focus,
      .control-center .notification-row:hover {
        opacity: 0.9;
        background: ${hex.base};
      }

      .notification-content {
        background: ${rgba "base" 0.9};
        padding: 10px;
        border-radius: 0px;
        border: 2px solid ${hex.lavender};
        margin: 0;
      }

      .close-button {
        background: ${hex.lavender};
        color: ${hex.base};
        text-shadow: none;
        padding: 0;
        border-radius: 5px;
        margin-top: 5px;
        margin-right: 5px;
      }
      .close-button:hover {
        box-shadow: none;
        background: ${hex.mauve};
        transition: all .15s ease-in-out;
        border: none;
      }

      .notification-action {
        border: 2px solid ${hex.lavender};
        border-top: none;
        border-radius: 5px;
      }

      .notification-default-action:hover,
      .notification-action:hover {
        color: ${hex.text};
        background: ${hex.lavender};
      }

      .inline-reply-entry {
        background: ${hex.base};
        color: ${hex.text};
        caret-color: ${hex.text};
        border: 1px solid ${hex.lavender};
        border-radius: 5px;
      }

      .inline-reply-button {
        margin-left: 4px;
        background: ${hex.base};
        border: 1px solid ${hex.lavender};
        border-radius: 5px;
        color: ${hex.text};
      }
      .inline-reply-button:hover {
        background: ${rgba "lavender" 0.15};
      }

      .summary {
        font-size: 16px;
        font-weight: 700;
        background: transparent;
        color: ${hex.lavender};
      }

      .time, .body {
        color: ${hex.text};
        text-shadow: none;
      }

      .control-center {
        background: ${rgba "base" 0.9};
        border: 2px solid ${hex.lavender};
        border-radius: 0px;
      }

      .widget-title {
        color: ${hex.lavender};
        background: ${hex.base};
        padding: 5px 10px;
        margin: 10px 10px 5px 10px;
        font-size: 1.5rem;
        border-radius: 5px;
      }

      .widget-title>button:hover {
        background: ${hex.lavender};
        color: ${hex.base};
      }

      .widget-dnd {
        background: ${rgba "base" 0.9};
        color: ${hex.lavender};
      }

      .widget-dnd>switch {
        background: ${hex.lavender};
      }
      .widget-dnd>switch:checked {
        background: ${hex.mauve};
      }

      .widget-volume, .widget-backlight {
        background: ${rgba "mantle" 0.9};
        color: ${hex.text};
      }
      .widget-volume>box>button {
        background: ${hex.lavender};
        border: none;
      }

      .per-app-volume {
        background-color: ${hex.base};
      }

      .floating-notifications {
        background: transparent;
        border-radius: 0;
      }

    '';
  };
}
