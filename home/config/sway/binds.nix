{ lib, ... }:
let
  # apps
  term      = "foot";
  browser   = "firefox";
  editor    = "emacsclient -c -a 'emacs'";
  chat      = "signal-desktop";
  ferdium   = "ferdium";
  office    = "onlyoffice-desktopeditors";
  passwords = "bitwarden";
  notes     = "obsidian";
  vm        = "virt-manager";

  file      = "foot -T yazi -a yazi yazi";
  music     = "foot -T cmus -a cmus cmus";
  rss       = "foot -T newsboat -a newsboat newsboat";
  aniCli    = "foot -T ani-cli -a ani-cli ani-cli";
  youtube   = "foot -T youtube-tui -a youtube-tui youtube-tui";
  audiomix  = "foot -T pulsemixer -a pulsemixer pulsemixer";
  monitor   = "foot -T btop -a btop btop";

  # launchers
  menu      = "fuzzel | xargs swaymsg exec --";
  menuWifi  = "rs_wifi | xargs swaymsg exec --";
  menuPower = "rs_power | xargs swaymsg exec --";
  menuEmoji = "rs_emoji | xargs swaymsg exec --";
  menuWall  = "rs_wall | xargs swaymsg exec --";
  menuScrot = "rs_scrot | xargs swaymsg exec --";
  menuBlue  = "rs_blue | xargs swaymsg exec --";
  menuClip  = "rs_clip | xargs swaymsg exec --";
  menuMount = "rs_mount | xargs swaymsg exec --";

  exitPrompt =
    "exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -B 'Yes, exit sway' 'swaymsg exit'";
in {
  wayland.windowManager.sway.config = {
    terminal = term;
    menu = menu;
    modifier = "Mod4";
    left  = "h";
    down  = "j";
    up    = "k";
    right = "l";

    floating.modifier = "Mod4";

    keybindings = lib.mkOptionDefault {
      # Start a terminal
      "Mod4+Return" = "exec ${term}";

      # Kill focused window
      "Mod4+q" = "kill";

      # XF86 Keys
      "XF86AudioRaiseVolume"  = "exec mediacontrol volume-up 5";
      "XF86AudioLowerVolume"  = "exec mediacontrol volume-down 5";
      "XF86AudioMute"         = "exec mediacontrol volume-mute";
      "XF86AudioMicMute"      = "exec mediacontrol mic-mute";
      "XF86AudioPause"        = "exec mediacontrol media-play-pause";
      "XF86AudioPlay"         = "exec mediacontrol media-play-pause";
      "XF86AudioNext"         = "exec mediacontrol media-play-next";
      "XF86AudioPrev"         = "exec mediacontrol media-play-prev";
      "XF86AudioStop"         = "exec mediacontrol media-play-stop";
      "XF86MonBrightnessUp"   = "exec mediacontrol brightness-up 5";
      "XF86MonBrightnessDown" = "exec mediacontrol brightness-down 5";
      "XF86News"              = "exec ${rss}";

      # Reload config
      "Mod4+Shift+Ctrl+r" = "reload";

      # Exit sway prompt
      "Mod4+Shift+Ctrl+q" = exitPrompt;

      ### Moving around
      "Mod4+h" = "focus left";
      "Mod4+j" = "focus down";
      "Mod4+k" = "focus up";
      "Mod4+l" = "focus right";

      "Mod4+Left"  = "focus left";
      "Mod4+Down"  = "focus down";
      "Mod4+Up"    = "focus up";
      "Mod4+Right" = "focus right";

      "Mod4+Shift+h" = "move left";
      "Mod4+Shift+j" = "move down";
      "Mod4+Shift+k" = "move up";
      "Mod4+Shift+l" = "move right";

      "Mod4+Shift+Left"  = "move left";
      "Mod4+Shift+Down"  = "move down";
      "Mod4+Shift+Up"    = "move up";
      "Mod4+Shift+Right" = "move right";

      ### Workspaces
      "Mod4+1" = "exec swswap 1";
      "Mod4+2" = "exec swswap 2";
      "Mod4+3" = "exec swswap 3";
      "Mod4+4" = "exec swswap 4";
      "Mod4+5" = "exec swswap 5";
      "Mod4+6" = "exec swswap 6";
      "Mod4+7" = "exec swswap 7";
      "Mod4+8" = "exec swswap 8";
      "Mod4+9" = "exec swswap 9";
      "Mod4+0" = "exec swswap 10";

      "Mod4+Shift+1" = "[con_id=__focused__] move container to workspace number 1, focus";
      "Mod4+Shift+2" = "[con_id=__focused__] move container to workspace number 2, focus";
      "Mod4+Shift+3" = "[con_id=__focused__] move container to workspace number 3, focus";
      "Mod4+Shift+4" = "[con_id=__focused__] move container to workspace number 4, focus";
      "Mod4+Shift+5" = "[con_id=__focused__] move container to workspace number 5, focus";
      "Mod4+Shift+6" = "[con_id=__focused__] move container to workspace number 6, focus";
      "Mod4+Shift+7" = "[con_id=__focused__] move container to workspace number 7, focus";
      "Mod4+Shift+8" = "[con_id=__focused__] move container to workspace number 8, focus";
      "Mod4+Shift+9" = "[con_id=__focused__] move container to workspace number 9, focus";
      "Mod4+Shift+0" = "[con_id=__focused__] move container to workspace number 10, focus";

      ### Layout stuff
      "Mod4+w" = "mode split";
      "Mod4+e" = "mode layout";

      ### Floating / focus toggles
      "Mod4+Mod1+space" = "floating toggle";
      "Mod4+space"      = "focus mode_toggle";

      # Focus parent
      "Mod4+Shift+Return" = "focus parent";

      ### Scratchpad
      "Mod4+Shift+s" = "move scratchpad";
      "Mod4+s"       = "scratchpad show";

      ### Resize
      "Mod4+r" = "mode resize";

      ### Apps mode
      "Mod4+a" = "mode apps";

      ### Launcher mode
      "Mod4+p" = "mode launcher";
    };

    modes = {
      split = {
        "v"      = "splith; mode default";
        "s"      = "splitv; mode default";
        "Return" = "mode default";
        "Escape" = "mode default";
      };

      layout = {
        "s"      = "layout stacking; mode default";
        "w"      = "layout tabbed; mode default";
        "t"      = "layout toggle split; mode default";
        "f"      = "fullscreen; mode default";
        "Return" = "mode default";
        "Escape" = "mode default";
      };

      resize = {
        "h" = "resize shrink width 10px";
        "j" = "resize grow height 10px";
        "k" = "resize shrink height 10px";
        "l" = "resize grow width 10px";

        "Left"  = "resize shrink width 10px";
        "Down"  = "resize grow height 10px";
        "Up"    = "resize shrink height 10px";
        "Right" = "resize grow width 10px";

        "Return" = "mode default";
        "Escape" = "mode default";
      };

      apps = {
        "f"       = "exec ${file}; mode default";
        "e"       = "exec ${editor}; mode default";
        "w"       = "exec ${browser}; mode default";
        "c"       = "exec ${chat}; mode default";
        "x"       = "exec ${ferdium}; mode default";
        "o"       = "exec ${office}; mode default";
        "n"       = "exec ${notes}; mode default";
        "m"       = "exec ${music}; mode default";
        "r"       = "exec ${rss}; mode default";
        "p"       = "exec ${passwords}; mode default";
        "v"       = "exec ${vm}; mode default";

        "Shift+b" = "exec ${monitor}; mode default";
        "Shift+p" = "exec ${audiomix}; mode default";
        "Shift+a" = "exec ${aniCli}; mode default";
        "Shift+y" = "exec ${youtube}; mode default";

        "Return"  = "mode default";
        "Escape"  = "mode default";
      };

      launcher = {
        "d"      = "exec ${menu}; mode default";
        "q"      = "exec ${menuPower}; mode default";
        "e"      = "exec ${menuEmoji}; mode default";
        "w"      = "exec ${menuWall}; mode default";
        "s"      = "exec ${menuScrot}; mode default";
        "b"      = "exec ${menuBlue}; mode default";
        "c"      = "exec ${menuClip}; mode default";
        "i"      = "exec ${menuWifi}; mode default";
        "m"      = "exec ${menuMount}; mode default";

        "Return" = "mode default";
        "Escape" = "mode default";
      };
    };
  };
}
