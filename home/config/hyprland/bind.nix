{ ... }:
let
  term = "kitty";

  # modifiers
  supMod = "SUPER";   # super key
  altMod = "ALT";     # alt key
  conMod = "CONTROL"; # control key

  # apps
  browser = "firefox";
  editor = "neovide";
  notes = "obsidian";
  chat1 = "signal-desktop";
  chat2 = "ferdium";
  officeSuite = "onlyoffice-desktopeditors";
  videoEditor = "kdenlive";
  imageEditor = "gimp";
  vectorEditor = "inkscape";
  audioEditor = "audacity";
  audioPatchBay = "qpwgraph";

  # run launchers
  run = "pkill fuzzel || fuzzel";
  rs_wifi = "pkill fuzzel || rs_wifi";
  rs_emoji = "pkill fuzzel || rs_emoji";
  rs_power = "pkill fuzzel || rs_power";

  # scratchpads
  spTerm = "pypr toggle term";
  spFile = "pypr toggle file";
  spWifi = "pypr toggle wifi";
  spBluetooth = "pypr toggle bluetooth";
  spClipboard = "pypr toggle clipboard";
  spAudioMixer = "pypr toggle audiomixer";
  spMonitor = "pypr toggle monitor";
  spYoutube = "pypr toggle youtube";
  spRss = "pypr toggle rss";
  spMusic = "pypr toggle music";
  spTermsonic = "pypr toggle termsonic";
  spWallpapers = "pypr toggle wallpapers";
in {
  wayland.windowManager.hyprland.settings = {
    bind = [
      # main binds
      "${supMod}, RETURN, exec, ${term}"            # launch a terminal
      "${supMod}, q, killactive"                    # kill active window
      "${supMod}_${conMod}_SHIFT, q, exit"          # exit the compositor
      "${supMod}, b, exec, pkill waybar || waybar"  # hide/show bar
      "${supMod}_${conMod}, space, togglefloating"  # toggle floating mode
      "${supMod}, f, fullscreen"                    # toggle fullscreen mode

      # focus binds
      "${supMod}, j, layoutmsg, cyclenext"                           # focus next window
      "${supMod}, k, layoutmsg, cycleprev"                           # focus previous window
      "${supMod}_${conMod}_SHIFT, RETURN, layoutmsg, focusmaster"    # focus master window
      "${supMod}, period, focusmonitor, r"                           # focus monitor to right
      "${supMod}, comma, focusmonitor, l"                            # focus monitor to left

      # layout binds
      "${supMod}_SHIFT, j, layoutmsg, swapnext"                # swap window with next
      "${supMod}_SHIFT, k, layoutmsg, swapprev"                # swap window with previous
      "${supMod}_SHIFT, l, layoutmsg, orientationnext"         # shift to next stack orientation
      "${supMod}_SHIFT, h, layoutmsg, orientationprev"         # shift to previous stack orientation
      "${supMod}, i, layoutmsg, addmaster"                     # add window to master area
      "${supMod}, d, layoutmsg, removemaster"                  # remove window to master area
      "${supMod}_${conMod}, RETURN, layoutmsg, swapwithmaster"   # swap window with master
      "${supMod}_SHIFT, period, movewindow, mon:r"             # move active window to monitor to the right
      "${supMod}_SHIFT, comma, movewindow, mon:l"              # move active window to monitor to the left

      # group binds
      "${supMod}, g, togglegroup"
      "${supMod}_${altMod}, g, moveoutofgroup, active"
      "${supMod}_${conMod}, g, lockactivegroup"
      "${supMod}_${conMod}, h, movegroupwindow, b"
      "${supMod}_${conMod}, l, movegroupwindow"
      "${supMod}_${conMod}, k, changegroupactive, b"
      "${supMod}_${conMod}, j, changegroupactive, f"
      "${supMod}_${altMod}, l, moveintogroup, r"
      "${supMod}_${altMod}, h, moveintogroup, l"
      "${supMod}_${altMod}, k, moveintogroup, u"
      "${supMod}_${altMod}, j, moveintogroup, d"

      # workspaces binds
      "${supMod}, 1, focusworkspaceoncurrentmonitor, 1"    # switch to workspace 1
      "${supMod}, 2, focusworkspaceoncurrentmonitor, 2"    # switch to workspace 2
      "${supMod}, 3, focusworkspaceoncurrentmonitor, 3"    # switch to workspace 3
      "${supMod}, 4, focusworkspaceoncurrentmonitor, 4"    # switch to workspace 4
      "${supMod}, 5, focusworkspaceoncurrentmonitor, 5"    # switch to workspace 5
      "${supMod}, 6, focusworkspaceoncurrentmonitor, 6"    # switch to workspace 6
      "${supMod}, 7, focusworkspaceoncurrentmonitor, 7"    # switch to workspace 7
      "${supMod}, 8, focusworkspaceoncurrentmonitor, 8"    # switch to workspace 8
      "${supMod}, 9, focusworkspaceoncurrentmonitor, 9"    # switch to workspace 9
      "${supMod}, 0, focusworkspaceoncurrentmonitor, 10"   # switch to workspace 10
      "${supMod}_SHIFT, 1, movetoworkspace, 1"             # move active window to workspace 1
      "${supMod}_SHIFT, 2, movetoworkspace, 2"             # move active window to workspace 2
      "${supMod}_SHIFT, 3, movetoworkspace, 3"             # move active window to workspace 3
      "${supMod}_SHIFT, 4, movetoworkspace, 4"             # move active window to workspace 4
      "${supMod}_SHIFT, 5, movetoworkspace, 5"             # move active window to workspace 5
      "${supMod}_SHIFT, 6, movetoworkspace, 6"             # move active window to workspace 6
      "${supMod}_SHIFT, 7, movetoworkspace, 7"             # move active window to workspace 7
      "${supMod}_SHIFT, 8, movetoworkspace, 8"             # move active window to workspace 8
      "${supMod}_SHIFT, 9, movetoworkspace, 9"             # move active window to workspace 9
      "${supMod}_SHIFT, 0, movetoworkspace, 10"            # move active window to workspace 10
      "${supMod}, mouse_down, workspace, e+1"              # move to next workspace with mouse wheel
      "${supMod}, mouse_up, workspace, e-1"                # move to previous workspace with mouse wheel
      "${supMod}, Right, workspace, e+1"                   # move to next workspace with right cursor key
      "${supMod}, Left, workspace, e-1"                    # move to previous workspace with left cursor key
      "${supMod}_SHIFT, Right, movetoworkspace, e+1"       # move active window to next workspace with right cursor key
      "${supMod}_SHIFT, Left, movetoworkspace, e-1"        # move active window to previous workspace with left cursor key
    ];

    binde = [
      "${supMod}_${conMod}_SHIFT, p, exec, hyprpicker -n -a"  # launch color picker
    ];

    bindm = [
      "${supMod}, mouse:272, movewindow"                      # window movement with mouse
      "${supMod}, mouse:273, resizewindow"                    # window resizing with mouse
    ];

    bindl = [
      # media keys
      ", XF86AudioRaiseVolume,  exec, swayosd-client --output-volume +5"
      ", XF86AudioLowerVolume,  exec, swayosd-client --output-volume -5"
      ", XF86AudioMute,         exec, swayosd-client --output-volume mute-toggle"
      ", XF86AudioMicMute,      exec, swayosd-client --input-volume mute-toggle"
      ", XF86AudioPause,        exec, playerctl play-pause"
      ", XF86AudioPlay,         exec, playerctl play-pause"
      ", XF86AudioNext,         exec, playerctl next"
      ", XF86AudioPrev,         exec, playerctl previous"
      ", XF86AudioStop,         exec, playerctl stop"
      ", XF86MonBrightnessUp,   exec, swayosd-client --brightness +5"
      ", XF86MonBrightnessDown, exec, swayosd-client --brightness -5"
    ];
  };
  wayland.windowManager.hyprland.extraConfig = ''
    # resize submap
    bind = ${supMod}, r, submap, resize
    submap = resize
    binde = , right, resizeactive, 30 0
    binde = , left, resizeactive, -30 0
    binde = , up, resizeactive, 0 -30
    binde = , down, resizeactive, 0 30
    binde = , l, resizeactive, 30 0
    binde = , h, resizeactive, -30 0
    binde = , k, resizeactive, 0 -30
    binde = , j, resizeactive, 0 30
    bind = , escape, submap, reset
    bind = , RETURN, submap, reset
    submap = reset
    
    # run launcher submap
    bind = ${supMod}, p, submap, launcher
    submap = launcher
    binde = , d, exec, fuzzel
    binde = , d, submap, reset
    binde = , w, exec, ${spWallpapers}
    binde = , w, submap, reset
    binde = , e, exec, rs_emoji
    binde = , e, submap, reset
    binde = , s, exec, rs_scrot
    binde = , s, submap, reset
    binde = , q, exec, rs_power
    binde = , q, submap, reset
    binde = , c, exec, ${spClipboard}
    binde = , c, submap, reset
    binde = , b, exec, ${spBluetooth}
    binde = , b, submap, reset
    binde = , i, exec, ${spWifi}
    binde = , i, submap, reset
    binde = , a, exec, ${spAudioMixer}
    binde = , a, submap, reset
    binde = , m, exec, ${spMonitor}
    binde = , m, submap, reset
    bind = , escape, submap, reset
    bind = , RETURN, submap, reset
    submap = reset
    
    # scratchpads submap
    bind = ${supMod}, s, submap, scratchpads
    submap = scratchpads
    binde = , RETURN, exec, ${spTerm}
    binde = , RETURN, submap, reset
    binde = , v, exec, ${spFile}
    binde = , v, submap, reset
    binde = , m, exec, ${spMusic}
    binde = , m, submap, reset
    binde = , n, exec, ${spTermsonic}
    binde = , n, submap, reset
    binde = , r, exec, ${spRss}
    binde = , r, submap, reset
    binde = , y, exec, ${spYoutube}
    binde = , y, submap, reset
    bind = , escape, submap, reset
    bind = , RETURN, submap, reset
    submap = reset
    
    # app submap
    bind = ${supMod}, a, submap, apps
    submap = apps
    binde = , e, exec, ${editor}
    binde = , e, submap, reset
    binde = , w, exec, ${browser}
    binde = , w, submap, reset
    binde = , s, exec, ${chat1}
    binde = , s, submap, reset
    binde = , f, exec, ${chat2}
    binde = , f, submap, reset
    binde = , n, exec, ${notes}
    binde = , n, submap, reset
    binde = , o, exec, ${officeSuite}
    binde = , o, submap, reset
    binde = , k, exec, ${videoEditor}
    binde = , k, submap, reset
    binde = , i, exec, ${vectorEditor}
    binde = , i, submap, reset
    binde = , g, exec, ${imageEditor}
    binde = , g, submap, reset
    binde = , a, exec, ${audioEditor}
    binde = , a, submap, reset
    binde = , p, exec, ${audioPatchBay}
    binde = , p, submap, reset
    bind = , escape, submap, reset
    bind = , RETURN, submap, reset
    submap = reset
  '';
}
