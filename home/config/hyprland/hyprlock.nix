{ ... }: let
  profile = import ./../../user/profile.nix {};
in {
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        grace = 1;
      };
      background = {
        monitor = "";
        path = "/home/${profile.user}/.config/hypr/wall/lock.png";
        blur_passes = 3; # 0 disables blurring
        blur_size = 3;
        noise = 0.0117;
        contrast = 0.8916;
        brightness = 0.8172;
        vibrancy = 0.1696;
        vibrancy_darkness = 0.0;
      };
      input-field = {
        monitor = "";
        size = "300, 50";
        outline_thickness = 2;
        dots_size = 0.33; # Scale of input-field height, 0.2 - 0.8
        dots_spacing = 0.15; # Scale of dots' absolute size, 0.0 - 1.0
        dots_center = true;
        dots_rounding = -1; # -1 default circle, -2 follow input-field rounding
        outer_color = "rgb(203, 166, 247)";
        inner_color = "rgb(30, 30, 46)";
        font_color = "rgb(205, 214, 244)";
        fade_on_empty = false;
        fade_timeout = 1000; # Milliseconds before fade_on_empty is triggered.
        placeholder_text = "<span foreground=\"##cdd6f4\" font_family=\"Inter\">Input password...</span>"; # Text rendered in the input box when it's empty.
        hide_input = false;
        rounding = -1; # -1 means complete rounding (circle/oval)
        check_color = "rgb(249, 226, 175)";
        fail_color = "rgb(243, 139, 168)"; # if authentication failed, changes outer_color and fail message color
        fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>"; # can be set to empty
        fail_transition = 300; # transition time in ms between normal outer_color and fail_color
        capslock_color = "rgb(166, 227, 161)"; # change color if capslock is on
        numlock_color = -1; # change color if numlock is on
        bothlock_color = -1; # when both locks are active. -1 means don't change outer color (same for above)
        invert_numlock = false; # change color if numlock is off
        position = "0, -50";
        halign = center;
        valign = center;
      };
      label = {
        monitor = "";
        text = "cmd[update:1000] echo '$TIME'";
        color = "rgb(205, 214, 244)";
        font_size = 92;
        font_family = "Inter Bold";
        position = "0, 80";
        halign = center;
        valign = center;
      };
    };
  };
}