{ ... }: {
  wayland.windowManager.sway = {
    config = {
      input = {
        "type:touchpad" = {
          dwt = false;
          tap = true;
          natural_scroll = true;
          middle_emulation = false;
        };
        "type:pointer" = {
          accel_profile = "adaptive";
          dwtp = false;
          pointer_accel = 0.1;
        };
        "type:keyboard" = {
          xkb_layout = "us,es";
          xkb_options = "grp:shift_caps_toggle";
        };
      };
      seat = {
        "*" = {
          hide_cursor = 10000;
        };
      };
      focus = {
        followMouse = true;
        mouseWarping = "container";
      };
    };
  };
}
