{ pkgs, ... }: {
  services.hyprpaper = {
    enable = true;
    package = pkgs.hyprpaper;
    settings = {
      preload = "$HOME/.config/hypr/wall/wall.png";
      wallpaper = [ 
        "eDP-1,$HOME/.config/hypr/wall/wall.png"
        "HDMI-A-1,$HOME/.config/hypr/wall/wall.png"
        "HDMI-A-2,$HOME/.config/hypr/wall/wall.png"
        "DP-1,$HOME/.config/hypr/wall/wall.png"
        "DP-3,$HOME/.config/hypr/wall/wall.png"
        "DP-4,$HOME/.config/hypr/wall/wall.png"
        "DP-5,$HOME/.config/hypr/wall/wall.png"
      ];
      splash = false;
    };
  };
}
