{ ... }: let
  theme = import ./../../user/theme.nix {};
  titleFont = "${theme.font-mono}:size=${toString theme.font-size}";
  bodyFont = "${theme.font-mono}:size=${toString theme.font-size}";
  summaryFont = "${theme.font-mono}:size=${toString theme.font-size}";
in{
  services.fnott = {
    enable = true;
    settings = {
      main = {
        stacking-order = "bottom-up";
        anchor = "top-right";
        icon-theme = "Papirus-Dark";
        selection-helper = "fuzzel --dmenu0";
        selection-helper-uses-null-separator = true;
        layer = "top";
        dpi-aware = "no";
        max-timeout = 10;
        max-width = 300;
        default-timeout = 5;
        title-font = titleFont;
        title-format = "";
        summary-font = summaryFont;
        summary-format = "<i>%s</i>\\n";
        body-font = bodyFont;
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
        background = "1d2021f2";
        border-color = "cc241dff";
        title-color = "fbf1c7ff";
        summary-color = "ebdbb2ff";
        body-color = "ebdbb2ff";
        progress-bar-color = "fbf1c7ff";
      };

      critical = {
        background = "1d2021f2";
        border-color = "fb4934ff";
      };
    };
  };
}
