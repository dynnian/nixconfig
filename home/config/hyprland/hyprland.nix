{ config, pkgs, ... }:
let
  profile = import ./../../user/profile.nix {};
in {
  home.packages = with pkgs; [
    hyprland
    hyprpaper
    hyprpicker
    hyprlock
    hyprpolkitagent
    hyprland-qtutils
    swayosd
    mako
    polkit_gnome
    wl-clipboard
    cliphist
    wf-recorder
  ];
  systemd.user.targets.hyprland-session.Unit.wants = [
    "xdg-desktop-autostart.target"
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    systemd = {
      enable = true;
      enableXdgAutostart = true;
      variables = [ "--all" ];
    };
    xwayland = {
      enable = true;
      force_zero_scaling = true;
    };
    settings = {
      input = {
        kb_layout = "${profile.layout},${profile.extralayout}";
        kb_options = "grp:shift_caps_toggle";
        follow_mouse = 1;
        scroll_method = "2fg";
        sensitivity = -0.2;
        touchpad {
            natural_scroll = true;
            disable_while_typing = false;
            tap-to-click = true;
        };
      };
      gestures = {
        workspace_swipe = true;
        workspace_swipe_touch = true;
      };
      cursor = {
        hide_on_touch = true;
        hide_on_key_press = true;
        inactive_timeout = 30;
      };
    };
  };
}