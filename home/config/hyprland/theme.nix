{ ... }: {
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = 2;
      gaps_out = 4;
      border_size = 3;
      resize_on_border = true;
      col.active_border = "rgb(89b4fa)";
      col.inactive_border = "rgb(313244)";
      layout = master;
      no_focus_fallback = true;
    };
    decoration {
      rounding = 10;
      dim_special = 0.5;
      blur {
        special = true;
        enabled = false;
        size = 4;
        passes = 2;
        new_optimizations = true;
        noise = 0.2;
        brightness = 0.8;
      };
      shadow {
        enabled = true;
        color = "rgba(1a1a1aee)";
        range = 5;
        render_power = 3;
      };
    };
  };
}