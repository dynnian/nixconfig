{ lib, config, ... }:
let
  isWorkpad = networking.hostName == "workpad";
in {
  wayland.windowManager.hyprland.settings = {
    env =
      [
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "CLUTTER_BACKEND,wayland"
        "QT_QPA_PLATFORM,wayland;xcb"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "QT_AUTO_SCREEN_SCALE_FACTOR,1"
        "GDK_BACKEND,wayland,x11"
        "SDL_VIDEODRIVER,wayland"
        "MOZ_ENABLE_WAYLAND,1"
        "WLR_NO_HARDWARE_CURSORS,1"
        "HYPRLAND_NO_SD_NOTIFY,0"
        "XKB_DEFAULT_LAYOUT,us"
        "ELECTRON_OZONE_PLATFORM_HINT,auto"
        "EDITOR,nvim"
        "VISUAL,neovide"
        "VIEWER,zathura"
        "TERMINAL,kitty"
        "XDG_TERMINAL_EMULATOR,kitty"
        "SSH_AUTH_SOCK,$HOME/.var/app/com.bitwarden.desktop/data/.bitwarden-ssh-agent.sock"
      ]
      ++ lib.optionals isWorkpad [
        "LIBVA_DRIVER_NAME,nvidia"
        "__GLX_VENDOR_LIBRARY_NAME,nvidia"
      ];
  };
}
