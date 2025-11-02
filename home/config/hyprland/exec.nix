{ ... }: {
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      "systemctl --user start hyprpolkitagent"
      "waybar"
      "mako"
      "wl-paste --type text --watch cliphist store"
      "wl-paste --type image --watch cliphist store"
      "hyprpaper"
      "hypridle"
      "swayosd-server"
      "nextcloud"
      "pypr"
    ];
    exec = [
      "pidof kanshi && kill -1 $(pidof kanshi) || kanshi"
    ];
  };
}
