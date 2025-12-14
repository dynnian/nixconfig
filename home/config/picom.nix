{ pkgs, ... }: {
  services.picom = {
    enable = true;

    package = pkgs.picom;

    backend = "glx";
    vSync = true;

    shadow = true;
    shadowExclude = [
      "name = 'Notification'"
      "class_g = 'Conky'"
      "class_g ?= 'Notify-osd'"
      "class_g = 'Cairo-clock'"
      "_GTK_FRAME_EXTENTS@:c"
    ];

    fade = true;

    settings = {
      # Animations (picom-next feature)
      #animations = [
      #  {
      #    triggers = [ "close" "hide" ];
      #    preset = "disappear";
      #    scaling = 4;
      #  }
      #  {
      #    triggers = [ "open" "show" ];
      #    preset = "appear";
      #    scaling = 4;
      #  }
      #];

      # Shadows
      shadow-radius = 7;
      shadow-offset-x = -7;
      shadow-offset-y = -7;
      crop-shadow-to-monitor = true;

      # Fading fine-tuning
      fade-in-step = 0.05;
      fade-out-step = 0.05;
      no-fading-openclose = false;

      # Blur
      blur-background = true;
      blur-method = "dual_kawase";
      blur-strength = 2;
      blur-kern = "3x3box";
      blur-background-exclude = [
        "window_type = 'dock'"
        "class_g ~= 'maim'"
        "class_i ~= 'maim'"
        "class_g ~= 'slop'"
        "class_i ~= 'slop'"
        "name ~= 'maim'"
        "name ~= 'slop'"
        "window_type = 'desktop'"
        "_GTK_FRAME_EXTENTS@:c"
      ];

      # General
      dbe = false;
      detect-client-opacity = true;
      detect-transient = true;
      glx-no-stencil = true;
      use-damage = true;
      unredir-if-possible = true;
      no-frame-pacing = true;
      unredir-if-possible-exclude = [
        "class_g = 'looking-glass-client' && !focused"
        "class_g = 'mpv' && focused"
      ];
      glx-use-copysubbuffer-mesa = true;
    };
  };
}
