{ lib, hostname, ... }: 
let
  isWorkPad = hostname == "workpad";
  theme = import ./../../../user/theme.nix {};
in{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      "systemctl --user start hyprpolkitagent"
      "hypridle"
      "hyprpaper"
      "pypr"
      "waybar"
      "swaync"
      "swayosd-server"
      "wl-paste --type text --watch cliphist store"
      "wl-paste --type image --watch cliphist store"
      "emacs --daemon"
      "nextcloud --background"
      "hyprctl setcursor ${theme.cursor} ${builtins.toString theme.cursor-size}"
    ] ++ lib.optionals isWorkPad [
      "snx-rs-gui"
    ];
    exec = [
      "pidof kanshi && kill -1 $(pidof kanshi) || kanshi"
    ];
  };
}
