{ pkgs, ... }: 
let
  theme = import ./../../user/theme.nix {};
in {
  services.kanshi = {
    enable = true;
    package = pkgs.kanshi;
    settings = [
      {
        profile.name = "desktop-hdmi";
        profile.exec = [
          "hyprctl keyword monitor desc:BNQ BenQ GW2490T K4R0610301Q, 1920x1080@100.00, 0x0, 1"
        ];
        profile.outputs = [
          { criteria = "BNQ BenQ GW2490T K4R0610301Q"; }
        ];
      }
      {
        profile.name = "home";
        profile.exec = [
          "hyprctl keyword monitor eDP-1, preferred, 0x0, 1"
          "hyprctl keyword monitor desc:BNQ BenQ GW2490T K4R0610301Q, 1920x1080@100.00, 1920x0, 1"
        ];
        profile.outputs = [
          { criteria = "eDP-1"; }
          { criteria = "BNQ BenQ GW2490T K4R0610301Q"; }
        ];
      }
      {
        profile.name = "work";
        profile.exec = [
          "hyprctl keyword monitor eDP-1, preferred, 0x0, 1"
          "hyprctl keyword monitor DP-3, preferred, 1920x0, 1"
          "hyprctl keyword monitor DP-4, preferred, 3840x0, 1, transform, 1"
        ];
        profile.outputs = [
          { criteria = "eDP-1"; }
          { criteria = "DP-3"; }
          { criteria = "DP-4"; }
        ];
      }
      {
        profile.name = "work-2";
        profile.exec = [
          "hyprctl keyword monitor eDP-1, preferred, 0x0, 1"
          "hyprctl keyword monitor DP-4, preferred, 1920x0, 1"
          "hyprctl keyword monitor DP-5, preferred, 3840x0, 1, transform, 1"
        ];
        profile.outputs = [
          { criteria = "eDP-1"; }
          { criteria = "DP-4"; }
          { criteria = "DP-5"; }
        ];
      }
      {
        profile.name = "hdmi";
        profile.exec = [
          "hyprctl keyword monitor eDP-1, preferred, 0x0, 1"
          "hyprctl keyword monitor HDMI-A-2, preferred, auto, 1, mirror, eDP-1"
        ];
        profile.outputs = [
          { criteria = "eDP-1"; }
          { criteria = "HDMI-A-2"; }
        ];
      }
      {
        profile.name = "hdmi-c";
        profile.exec = [
          "hyprctl keyword monitor eDP-1, preferred, 0x0, 1"
          "hyprctl keyword monitor DP-1, preferred, auto, 1, mirror, eDP-1"
        ];
        profile.outputs = [
          { criteria = "eDP-1"; }
          { criteria = "DP-1"; }
        ];
      }
      {
        profile.name = "laptop";
        profile.exec = [
          "hyprctl keyword monitor eDP-1, preferred, 0x0, 1"
        ];
        profile.outputs = [
          { criteria = "eDP-1"; }
        ];
      }
    ];
  };
}

