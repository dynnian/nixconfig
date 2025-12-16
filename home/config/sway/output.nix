{ ... }: {
  wayland.windowManager.sway = {
    config = {
      output = {
        "*" = {
          bg = "~/.config/sway/wallpaper/background.* fill";
        };
      };
    };
  };
}
