{ config, pkgs, lib, hostname, ... }:
let
  profile = import ./../../../user/profile.nix {};
  isClaymore = hostname == "claymore";
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
    grim
    slurp
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
    };
    settings = {
      input = {
        kb_layout = "${profile.layout},${profile.extralayout}";
        kb_options = "grp:shift_caps_toggle";
        follow_mouse = 1;
        scroll_method = "2fg";
        sensitivity = -0.2;
        touchpad = {
            natural_scroll = true;
            disable_while_typing = false;
            tap-to-click = true;
        };
      };
      device = lib.mkIf isClaymore {
        "ttps/2-ibm-trackpoint" = {
          sensitivity = 1;
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
      misc = {
          allow_session_lock_restore = true;
          disable_hyprland_logo = true;
          disable_splash_rendering = true;
          mouse_move_enables_dpms = true;
          mouse_move_focuses_monitor = true;
      };
    };
  };
}
