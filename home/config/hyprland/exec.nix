{ lib, hostname, ... }: 
let
  isWorkPad = hostname == "workpad";
in{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      "systemctl --user start hyprpolkitagent"
      "waybar"
      "mako"
      "clipse -listen"
      "hyprpaper"
      "hypridle"
      "swayosd-server"
      "nextcloud --background"
      "pypr"
    ] ++ lib.optionals isWorkPad [
      "snx-rs-gui"
    ];
    exec = [
      "pidof kanshi && kill -1 $(pidof kanshi) || kanshi"
    ];
  };
}
