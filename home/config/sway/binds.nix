{ lib, ... }:
let
  # apps
  term       = "foot";
  browser    = "$BROWSER";
  editor     = "$VISUAL";
  chat       = "signal-desktop";
  ferdium    = "ferdium";
  office     = "onlyoffice-desktopeditors";
  passwords  = "bitwarden";
  notes      = "obsidian";
  vm         = "virt-manager";
  ssh        = "foot -T lazyssh -a lazyssh lazyssh";
  database   = "foot -T lazysql -a lazysql lazysql";
  git        = "foot -T lazygit -a lazygit lazygit";

  # TUIs
  file       = "sway-scratchpad -t -p '0,10' -atc -d 65%x65% -- foot -T yazi -a yazi yazi";
  music      = "sway-scratchpad -t -p '0,10' -atc -d 65%x65% -- foot -T cmus -a cmus cmus";
  smusic     = "sway-scratchpad -t -p '0,10' -atc -d 65%x65% -- foot -T subtui -a subtui subtui";
  rss        = "sway-scratchpad -t -p '0,10' -atc -d 65%x65% -- foot -T newsboat -a newsboat newsboat";
  anime      = "sway-scratchpad -t -p '0,10' -atc -d 65%x65% -- foot -T ani-cli -a ani-cli ani-cli";
  youtube    = "sway-scratchpad -t -p '0,10' -atc -d 65%x65% -- foot -T youtube-tui -a youtube-tui youtube-tui";
  audiomixer = "sway-scratchpad -t -p '0,10' -atc -d 65%x65% -- foot -T pulsemixer -a pulsemixer pulsemixer";
  monitor    = "sway-scratchpad -t -p '0,10' -atc -d 65%x65% -- foot -T btop -a btop btop";
  wifi       = "sway-scratchpad -t -p '0,10' -atc -d 65%x65% -- foot -T impala -a impala impala";
  bluetooth  = "sway-scratchpad -t -p '0,10' -atc -d 65%x65% -- foot -T bluetui -a bluetui bluetui";
  clipboard  = "sway-scratchpad -t -p '0,10' -atc -d 65%x65% -- foot -T clipse -a clipse clipse";
  pomodoro   = "sway-scratchpad -t -p '0,10' -atc -d 65%x65% -- foot -T timr-tui -a timr-tui timr-tui";

  # launchers
  menu       = "fuzzel | xargs swaymsg exec --";
  menuPower  = "rs_power | xargs swaymsg exec --";
  menuEmoji  = "rs_emoji | xargs swaymsg exec --";
  menuWall   = "rs_wall | xargs swaymsg exec --";
  menuScrot  = "rs_scrot | xargs swaymsg exec --";
  menuMount  = "rs_mount | xargs swaymsg exec --";

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

      "Mod4+Ctrl+h" = "focus output left";
      "Mod4+Ctrl+j" = "focus output down";
      "Mod4+Ctrl+k" = "focus output up";
      "Mod4+Ctrl+l" = "focus output right";

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
      "Mod4+1" = "workspace number 1";
      "Mod4+2" = "workspace number 2";
      "Mod4+3" = "workspace number 3";
      "Mod4+4" = "workspace number 4";
      "Mod4+5" = "workspace number 5";
      "Mod4+6" = "workspace number 6";
      "Mod4+7" = "workspace number 7";
      "Mod4+8" = "workspace number 8";
      "Mod4+9" = "workspace number 9";
      "Mod4+0" = "workspace number 10";

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
      "Mod4+Ctrl+s"       = "scratchpad show";

      ### Resize
      "Mod4+r" = "mode resize";

      ### Apps mode
      "Mod4+a" = "mode apps";

      ### Launcher mode
      "Mod4+p" = "mode launcher";

      ### Scratchpad mode
      "Mod4+s" = "mode spad";
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
        "s"       = "exec ${ssh}; mode default";
        "d"       = "exec ${database}; mode default";
        "g"       = "exec ${git}; mode default";

        "Return"  = "mode default";
        "Escape"  = "mode default";
      };

      spad = {
        "f"      = "exec ${file}; mode default";
        "i"      = "exec ${wifi}; mode default";
        "b"      = "exec ${bluetooth}; mode default";
        "m"      = "exec ${music}; mode default";
        "n"      = "exec ${smusic}; mode default";
        "c"      = "exec ${clipboard}; mode default";
        "p"      = "exec ${audiomixer}; mode default";
        "t"      = "exec ${pomodoro}; mode default";
        "y"      = "exec ${youtube}; mode default";
        "a"      = "exec ${anime}; mode default";
        "h"      = "exec ${monitor}; mode default";

        "Return"  = "mode default";
        "Escape"  = "mode default";
      };

      launcher = {
        "d"      = "exec ${menu}; mode default";
        "q"      = "exec ${menuPower}; mode default";
        "e"      = "exec ${menuEmoji}; mode default";
        "w"      = "exec ${menuWall}; mode default";
        "s"      = "exec ${menuScrot}; mode default";
        "m"      = "exec ${menuMount}; mode default";

        "Return" = "mode default";
        "Escape" = "mode default";
      };
    };
  };
}
