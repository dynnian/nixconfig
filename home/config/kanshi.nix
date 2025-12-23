{ pkgs, ... }: {
  home.packages = with pkgs; [
    wl-mirror
  ];
  services.kanshi = {
    enable = true;
    package = pkgs.kanshi;
    settings = [
      {
        profile.name = "desktop-hdmi";
        profile.exec = [
          "pgrep wl-mirror && pkill -n wl-mirror"
        ];
        profile.outputs = [
          {
            criteria = "BNQ BenQ GW2490T K4R0610301Q";
            mode = "1920x1080@100Hz";
            position = "1920,0";
          }
        ];
      }

      {
        profile.name = "home";
        profile.exec = [
          "pgrep wl-mirror && pkill -n wl-mirror"
        ];
        profile.outputs = [
          { criteria = "eDP-1"; position = "0,0"; }
          {
            criteria = "BNQ BenQ GW2490T K4R0610301Q";
            mode = "1920x1080@100Hz";
            position = "1920,0";
          }
        ];
      }

      {
        profile.name = "work";
        profile.exec = [
          "pgrep wl-mirror && pkill -n wl-mirror"
        ];
        profile.outputs = [
          { criteria = "eDP-1"; position = "0,0"; }
          { criteria = "Dell Inc. DELL P2419H F3JTPF3";  position = "1920,0"; }
          { criteria = "Dell Inc. DELL P2417H KH0NG87B7N0B";  position = "3840,0"; transform = "90"; }
        ];
      }

      {
        profile.name = "hdmi1";
        profile.exec = [
          "pgrep wl-mirror && pkill -n wl-mirror"
          "wl-present mirror eDP-1 --fullscreen-output HDMI-A-1 --fullscreen"
        ];
        profile.outputs = [
          { criteria = "eDP-1";     position = "0,0"; }
          { criteria = "HDMI-A-1";  position = "1920,0"; }
        ];
      }

      {
        profile.name = "hdmi2";
        profile.exec = [
          "pgrep wl-mirror && pkill -n wl-mirror"
          "wl-present mirror eDP-1 --fullscreen-output HDMI-A-2 --fullscreen"
        ];
        profile.outputs = [
          { criteria = "eDP-1";     position = "0,0"; }
          { criteria = "HDMI-A-2";  position = "1920,0"; }
        ];
      }

      {
        profile.name = "hdmi-c";
        profile.exec = [
          "pgrep wl-mirror && pkill -n wl-mirror"
          "wl-present mirror eDP-1 --fullscreen-output DP-1 --fullscreen"
        ];
        profile.outputs = [
          { criteria = "eDP-1"; position = "0,0"; }
          { criteria = "DP-1";  position = "1920,0"; }
        ];
      }

      {
        profile.name = "laptop";
        profile.exec = [
          "pgrep wl-mirror && pkill -n wl-mirror"
        ];
        profile.outputs = [
          { criteria = "eDP-1"; position = "0,0"; }
        ];
      }
    ];
  };
}
