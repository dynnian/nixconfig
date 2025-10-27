{ pkgs, ... }:

{
  services.kanshi = {
    enable = true;
    package = pkgs.kanshi;

    profiles = {
      triple = {
        exec = [
          "pgrep wl-mirror && pkill -n wl-mirror"
          "hyprctl keyword monitor eDP-1, preferred, 0x0, 1"
          "hyprctl keyword monitor DP-3, 1920x1080@100.00, 1920x0, 1"
          "hyprctl keyword monitor DP-1, 1280x1024@75.03, 3840x0, 1"
        ];
        outputs = [
          { criteria = "eDP-1"; }
          { criteria = "DP-3"; }
          { criteria = "DP-1"; }
        ];
      };

      "triple-2" = {
        exec = [
          "pgrep wl-mirror && pkill -n wl-mirror"
          "hyprctl keyword monitor eDP-1, preferred, 0x0, 1"
          "hyprctl keyword monitor DP-4, 1920x1080@100.00, 1920x0, 1"
          "hyprctl keyword monitor DP-1, 1280x1024@75.03, 3840x0, 1"
        ];
        outputs = [
          { criteria = "eDP-1"; }
          { criteria = "DP-4"; }
          { criteria = "DP-1"; }
        ];
      };

      hdmi = {
        exec = [
          "pgrep wl-mirror && pkill -n wl-mirror"
          "hyprctl keyword monitor eDP-1, preferred, 0x0, 1"
          "hyprctl keyword monitor HDMI-A-2, preferred, auto, 1, mirror, eDP-1"
        ];
        outputs = [
          { criteria = "eDP-1"; }
          { criteria = "HDMI-A-2"; }
        ];
      };

      work = {
        exec = [
          "pgrep wl-mirror && pkill -n wl-mirror"
          "hyprctl keyword monitor eDP-1, preferred, 0x0, 1"
          "hyprctl keyword monitor DP-3, preferred, 1920x0, 1"
          "hyprctl keyword monitor DP-4, preferred, 3840x0, 1, transform, 1"
        ];
        outputs = [
          { criteria = "eDP-1"; }
          { criteria = "DP-3"; }
          { criteria = "DP-4"; }
        ];
      };

      "work-2" = {
        exec = [
          "pgrep wl-mirror && pkill -n wl-mirror"
          "hyprctl keyword monitor eDP-1, preferred, 0x0, 1"
          "hyprctl keyword monitor DP-4, preferred, 1920x0, 1"
          "hyprctl keyword monitor DP-5, preferred, 3840x0, 1, transform, 1"
        ];
        outputs = [
          { criteria = "eDP-1"; }
          { criteria = "DP-4"; }
          { criteria = "DP-5"; }
        ];
      };

      "hdmi-c" = {
        exec = [
          "pgrep wl-mirror && pkill -n wl-mirror"
          "hyprctl keyword monitor eDP-1, preferred, 0x0, 1"
          "hyprctl keyword monitor DP-1, preferred, auto, 1, mirror, eDP-1"
        ];
        outputs = [
          { criteria = "eDP-1"; }
          { criteria = "DP-1"; }
        ];
      };

      laptop = {
        exec = [
          "pgrep wl-mirror && pkill -n wl-mirror"
          "hyprctl keyword monitor eDP-1, preferred, 0x0, 1"
        ];
        outputs = [
          { criteria = "eDP-1"; }
        ];
      };
    };
  };
}

