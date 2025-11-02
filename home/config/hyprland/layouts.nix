{ ... }: {
  wayland.windowManager.hyprland.settings = {
    dwindle = {
      pseudotile = true;
      preserve_split = true;
    };
    master = {
      new_status = "slave";
      drop_at_cursor = false;
      orientation = "left";
      mfact = 0.50;
    };
  };
}
