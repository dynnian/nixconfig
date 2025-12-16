{ ... }: {
  wayland.windowManager.sway = {
    config.bars = [
      {
        command = "waybar";
        position = "top";
        mode = "dock";
      }
    ];
    config.startup = [
      { command = "hash dbus-update-activation-environment 2>/dev/null && dbus-update-activation-environment DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"; }
      { command = "sway-audio-idle-inhibit"; }
      { command = "wl-paste --type text --watch cliphist store"; }
      { command = "wl-paste --type image --watch cliphist store"; }
      { command = "dex -a -s ~/.config/autostart"; }
      { command = "emacs --daemon"; }
      { command = "mkdir -p ~/.config/sway/wallpaper"; }
      { command = "pidof kanshi && kill -1 $(pidof kanshi) || kanshi"; always = true; }
      { command = "gtk-update-icon-cache"; always = true; }
    ];
  };
}
