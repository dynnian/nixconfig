{ hostname, lib, ... }: let
  isWorkPad = hostname == "workpad";
in {
  wayland.windowManager.sway = {
    extraSessionCommands = ''
      export XDG_CURRENT_DESKTOP=sway
      export XDG_SESSION_DESKTOP=sway
      export XDG_SESSION_TYPE=wayland
      export EGL_PLATFORM=wayland
      export CLUTTER_PLATFORM=wayland
      export QT_QPA_PLATFORM=wayland
      export GDK_BACKEND=wayland
      export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
      export XKB_DEFAULT_LAYOUT=us
      export MOZ_ENABLE_WAYLAND=1
      export MOZ_WAYLAND_USE_VAAPI=1
      export MOZ_DISABLE_RDD_SANDBOX=1 
      export ELECTRON_OZONE_PLATFORM_HINT=auto
      export GTK_CSD=0
      export WLR_RENDER_NO_EXPLICIT_SYNC=1
    '' ++ lib.optionals isWorkPad ''
      export WLR_NO_HARDWARE_CURSORS=1
      export WLR_RENDERER=vulkan
      export GBM_BACKEND=nvidia-drm
      export __GL_GSYNC_ALLOWED=0
      export __GL_VRR_ALLOWED=0
      export __GLX_VENDOR_LIBRARY_NAME=nvidia
      export XWAYLAND_NO_GLAMOR=1
    '';
  };
}
