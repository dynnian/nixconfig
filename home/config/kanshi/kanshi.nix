{ config, lib, pkgs, ... }:

{
  services.kanshi = {
    enable = true;

    profiles = {
      home = {
        exec = [
          "pgrep wl-mirror && pkill -n wl-mirror"
        ];
        outputs = [
          { criteria = "eDP-1"; position = "0,0"; }
          { criteria = "DP-4"; mode = "1920x1080@100Hz"; position = "1920,0"; }
        ];
      };

      home-2 = {
        exec = [
          "pgrep wl-mirror && pkill -n wl-mirror"
        ];
        outputs = [
          { criteria = "eDP-1"; position = "0,0"; }
          { criteria = "DP-3"; mode = "1920x1080@100Hz"; position = "1920,0"; }
        ];
      };

      work = {
        exec = [
          "pgrep wl-mirror && pkill -n wl-mirror"
        ];
        outputs = [
          { criteria = "eDP-1"; position = "0,455"; }
          { criteria = "DP-4"; position = "1920,455"; }
          { criteria = "DP-5"; position = "3840,0"; transform = "90"; }
        ];
      };

      work-2 = {
        exec = [
          "pgrep wl-mirror && pkill -n wl-mirror"
        ];
        outputs = [
          { criteria = "eDP-1"; position = "0,455"; }
          { criteria = "DP-3"; position = "1920,455"; }
          { criteria = "DP-4"; position = "3840,0"; transform = "90"; }
        ];
      };

      hdmi = {
        exec = [
          "pgrep wl-mirror && pkill -n wl-mirror"
          "wl-present mirror eDP-1 --fullscreen-output HDMI-A-2 --fullscreen"
        ];
        outputs = [
          { criteria = "eDP-1"; position = "0,0"; }
          { criteria = "HDMI-A-2"; position = "1920,0"; }
        ];
      };

      hdmi-c = {
        exec = [
          "pgrep wl-mirror && pkill -n wl-mirror"
          "wl-present mirror eDP-1 --fullscreen-output DP-1 --fullscreen"
        ];
        outputs = [
          { criteria = "eDP-1"; position = "0,0"; }
          { criteria = "DP-1"; position = "1920,0"; }
        ];
      };

      laptop = {
        exec = [
          "pgrep wl-mirror && pkill -n wl-mirror"
        ];
        outputs = [
          { criteria = "eDP-1"; position = "0,0"; }
        ];
      };
    };
  };
}

