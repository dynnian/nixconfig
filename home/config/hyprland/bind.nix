{ ... }:
let
  apps = import ./../../user/apps.nix {};

  term = "kitty";

  # modifiers
  supMod = "SUPER";   # super key
  altMod = "ALT";     # alt key
  conMod = "CONTROL"; # control key

  # run launchers
  run = "pkill fuzzel || fuzzel";
  rs_wifi = "pkill fuzzel || rs_wifi";
  rs_wall = "pkill fuzzel || rs_wall";
  rs_emoji = "pkill fuzzel || rs_emoji";
  rs_clip = "pkill fuzzel || rs_clip";
  rs_scrot = "pkill fuzzel || rs_scrot";
  rs_power = "pkill fuzzel || rs_power";
  rs_blue = "pkill fuzzel || rs_blue";

  # scratchpads
  spTerm = "pypr toggle term";
  spFile = "pypr toggle file";
  spMusic = "pypr toggle music";
  spRss = "pypr toggle rss";
  spAnime = "pypr toggle anime";
  spMovies = "pypr toggle movies";
  spYoutube = "pypr toggle youtube";
  spAudioMixer = "pypr toggle audiomixer";
  spMonitor = "pypr toggle monitor";
in {
  wayland.windowManager.hyprland.settings = {
    bind = [
      # main binds
      "${supMod}, RETURN, exec, ${term}"            # launch a terminal
      "${supMod}, q, killactive"                    # kill active window
      "${supMod}_${conMod_SHIFT}, q, exit"          # exit the compositor
      "${supMod}, b, exec, pkill waybar || waybar"  # hide/show bar
      "${supMod}_${conMod}, space, togglefloating"  # toggle floating mode
      "${supMod}, f, fullscreen"                    # toggle fullscreen mode

      # focus binds
      "${supMod}, j, layoutmsg, cyclenext"                           # focus next window
      "${supMod}, k, layoutmsg, cycleprev"                           # focus previous window
      "${supMod}_${conMod_SHIFT}, RETURN, layoutmsg, focusmaster"    # focus master window
      "${supMod}, period, focusmonitor, r"                           # focus monitor to right
      "${supMod}, comma, focusmonitor, l"                            # focus monitor to left

      # layout binds
      "${supMod}_SHIFT, j, layoutmsg, swapnext"                # swap window with next
      "${supMod}_SHIFT, k, layoutmsg, swapprev"                # swap window with previous
      "${supMod}_SHIFT, l, layoutmsg, orientationnext"         # shift to next stack orientation
      "${supMod}_SHIFT, h, layoutmsg, orientationprev"         # shift to previous stack orientation
      "${supMod}, i, layoutmsg, addmaster"                     # add window to master area
      "${supMod}, d, layoutmsg, removemaster"                  # remove window to master area
      "${supMod}_$conMod, RETURN, layoutmsg, swapwithmaster"   # swap window with master
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

      # submaps
      "${supMod}, p, submap, launchers"        # launchers submap
      "${supMod}, s, submap, scratchpads"      # scratchpads submap
      "${supMod}, a, submap, apps"             # apps submap
      "${supMod}, r, submap, resize"           # resize submap
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
      ", XF86AudioRaiseVolume,  exec, swayosd-client --output-volume +5"          # increase volume by 5%
      ", XF86AudioLowerVolume,  exec, swayosd-client --output-volume -5"          # decrease volumy by 5%
      ", XF86AudioMute,         exec, swayosd-client --output-volume mute-toggle" # toggle mute
      ", XF86AudioMicMute,      exec, swayosd-client --input-volume mute-toggle"  # toggle mic mute
      ", XF86AudioPause,        exec, playerctl play-pause"                       # play-pause toggle
      ", XF86AudioPlay,         exec, playerctl play-pause"                       # play-pause toggle
      ", XF86AudioNext,         exec, playerctl next"                             # switch to next media
      ", XF86AudioPrev,         exec, playerctl previous"                         # switch to previous media
      ", XF86AudioStop,         exec, playerctl stop"                             # stop media playback
      ", XF86News,              exec, $rss"                                       # launch news feed reader
      ", XF86MonBrightnessUp,   exec, swayosd-client --brightness +5"             # increase brightness by 5%
      ", XF86MonBrightnessDown, exec, swayosd-client --brightness -5"             # decrease brightness by 5%
    ];

    submaps = [
      "resize" = {
        settings = {
          binde = [
            ", right, resizeactive, 30 0"
            ", left, resizeactive, -30 0"
            ", up, resizeactive, 0 -30"
            ", down, resizeactive, 0 30"
            ", l, resizeactive, 30 0"
            ", h, resizeactive, -30 0"
            ", k, resizeactive, 0 -30"
            ", j, resizeactive, 0 30"
          ];
          bind = [
            "${supMod}, escape, submap, reset"
          ];
        };
      };
      "launchers" = {
        settings = {
          binde = [
            # Launchers
            ", d, exec, ${run}"
            ", d, exec, submap, reset"
            ", i, exec, ${rs_wifi}"
            ", i, exec, submap, reset"
            ", w, exec, ${rs_wall}"
            ", w, exec, submap, reset"
            ", e, exec, ${rs_emoji}"
            ", e, exec, submap, reset"
            ", c, exec, ${rs_clip}"
            ", c, exec, submap, reset"
            ", s, exec, ${rs_scrot}"
            ", s, exec, submap, reset"
            ", q, exec, ${rs_power}"
            ", q, exec, submap, reset"
            ", b, exec, ${rs_blue}"
            ", b, exec, submap, reset"
          ];
          bind = [
            ", escape, submap, reset"
          ];
        };
      };
      "scratchpads" = {
        settings = {
          binde = [
            ", s, exec, ${spTerm}"
            ", s, exec, submap, reset"
            ", v, exec, ${spFile}"
            ", v, exec, submap, reset"
            ", m, exec, ${spMusic}"
            ", m, exec, submap, reset"
            ", r, exec, ${spRss}"
            ", r, exec, submap, reset"
            ", a, exec, ${spAnime}"
            ", a, exec, submap, reset"
            ", y, exec, ${spYoutube}"
            ", y, exec, submap, reset"
            ", b, exec, ${spMonitor}"
            ", b, exec, submap, reset"
            ", p, exec, ${spAudioMixer}"
            ", p, exec, submap, reset"
          ];
          bind = [
            ", escape, submap, reset"
          ];
        };
      };
      "apps" = {
        settings = {
          binde = [
            ", e, exec, ${apps.editor}"
            ", e, exec, submap, reset"
            ", b, exec, ${apps.browser}"
            ", b, exec, submap, reset"
            ", c, exec, ${apps.messaging[0]}"
            ", c, exec, submap, reset"
            ", x, exec, ${apps.messaging[1]}"
            ", x, exec, submap, reset"
            ", n, exec, ${apps.notes}"
            ", n, exec, submap, reset"
            ", o, exec, ${apps.office}"
            ", o, exec, submap, reset"
          ];
          bind = [
            ", escape, submap, reset"
          ];
        };
      };
    ];
  };
}