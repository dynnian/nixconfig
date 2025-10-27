{ config, pkgs, ... }:

let
  scripts = pkgs.callPackage ../scripts/scripts.nix {};
  theme = import ./../../user/theme.nix {};

  mod = "Mod4";
  terminal = "${pkgs.foot}/bin/foot";
  menu = "${pkgs.fuzzel}/bin/fuzzel | xargs swaymsg exec --";
  bar = "${pkgs.waybar}/bin/waybar";
  file_manager = "${pkgs.yazi}/bin/yazi";
  signal = "${pkgs.signal-desktop}/bin/signal-desktop";
  ferdium = "${pkgs.ferdium}/bin/ferdium";
  obsidian = "${pkgs.obsidian}/bin/obsidian";
in
{
  # Enable sway and related tools
  wayland.windowManager.sway = {
    enable = true;
    package = pkgs.sway;
    wrapperFeatures = {
      base = true;
      gtk = true;
    };
    extraPackages = with pkgs; [
      swaylock
      swayidle
      polkit_gnome
      dex
      sway-audio-idle-inhibit
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
    ];

    # Main sway configuration
    config = rec {
      modifier = "${mod}";
      terminal = "${terminal}";
      menu = "${menu}";
      bars = [{
        command = "${bar}";
      }];

      input = {
        "type:touchpad" = {
          dwt = "disabled";
          tap = "enabled";
          natural_scroll = "enabled";
          middle_emulation = "enabled";
        };
        "type:pointer" = {
          accel_profile = "adaptive";
          pointer_accel = "0.1";
        };
        "type:keyboard" = {
          xkb_layout = "us,es";
          xkb_options = "grp:shift_caps_toggle";
        };
      };

      seat."*" = {
        hide_cursor = "10000";
      };

      focus_follows_mouse = "yes";

      output."*" = {
        bg = "~/.config/sway/wallpaper/background.png fill";
      };

      gaps = {
        inner = 5;
      };

      default_border = "pixel 3";
      default_floating_border = "pixel 3";
      smart_borders = "off";

      font = "pango:${theme.font-mono} 12";

      colors = {
        focused = {
          border = "#cc241d";
          background = "#665c54";
          text = "#ebdbb2";
          indicator = "#689d6a";
          child_border = "#cc241d";
        };
        focused_inactive = {
          border = "#665c54";
          background = "#665c54";
          text = "#ebdbb2";
          indicator = "#98971a";
          child_border = "#665c54";
        };
        unfocused = {
          border = "#665c54";
          background = "#282828";
          text = "#a89984";
          indicator = "#98971a";
          child_border = "#665c54";
        };
        urgent = {
          border = "#d79921";
          background = "#d79921";
          text = "#1d2021";
          indicator = "#ff0000";
          child_border = "#ff0000";
        };
      };

      keybindings = {
        "Mod4+Return" = "exec ${terminal}";
        "Mod4+q" = "kill";

        "XF86AudioRaiseVolume" = "exec ${scripts.mediacontrol} volume-up 5";
        "XF86AudioLowerVolume" = "exec ${scripts.mediacontrol} volume-down 5";
        "XF86AudioMute" = "exec ${scripts.mediacontrol} volume-mute";
        "XF86AudioMicMute" = "exec ${scripts.mediacontrol} mic-mute";
        "XF86AudioPause" = "exec ${scripts.mediacontrol} media-play-pause";
        "XF86AudioPlay" = "exec ${scripts.mediacontrol} media-play-pause";
        "XF86AudioNext" = "exec ${scripts.mediacontrol} media-play-next";
        "XF86AudioPrev" = "exec ${scripts.mediacontrol} media-play-prev";
        "XF86AudioStop" = "exec ${scripts.mediacontrol} media-play-stop";
        "XF86MonBrightnessUp" = "exec ${scripts.mediacontrol} brightness-up 5";
        "XF86MonBrightnessDown" = "exec ${scripts.mediacontrol} brightness-down 5";
        "XF86News" = "exec ${terminal} -T newsboat -a newsboat newsboat";

        "${mod}+Shift+Ctrl+r" = "reload";
        "${mod}+Shift+Ctrl+q" = "exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -B 'Yes, exit sway' 'swaymsg exit'";

        "${mod}+h" = "focus left";
        "${mod}+j" = "focus down";
        "${mod}+k" = "focus up";
        "${mod}+l" = "focus right";

        "${mod}+Left" = "focus left";
        "${mod}+Down" = "focus down";
        "${mod}+Up" = "focus up";
        "${mod}+Right" = "focus right";

        "${mod}+Shift+h" = "move left";
        "${mod}+Shift+j" = "move down";
        "${mod}+Shift+k" = "move up";
        "${mod}+Shift+l" = "move right";

        "${mod}+Shift+Left" = "move left";
        "${mod}+Shift+Down" = "move down";
        "${mod}+Shift+Up" = "move up";
        "${mod}+Shift+Right" = "move right";

        "${mod}+1" = "workspace number 1";
        "${mod}+2" = "workspace number 2";
        "${mod}+3" = "workspace number 3";
        "${mod}+4" = "workspace number 4";
        "${mod}+5" = "workspace number 5";
        "${mod}+6" = "workspace number 6";
        "${mod}+7" = "workspace number 7";
        "${mod}+8" = "workspace number 8";
        "${mod}+9" = "workspace number 9";
        "${mod}+0" = "workspace number 10";

        "${mod}+Shift+1" = "move container to workspace number 1, focus";
        "${mod}+Shift+2" = "move container to workspace number 2, focus";
        "${mod}+Shift+3" = "move container to workspace number 3, focus";
        "${mod}+Shift+4" = "move container to workspace number 4, focus";
        "${mod}+Shift+5" = "move container to workspace number 5, focus";
        "${mod}+Shift+6" = "move container to workspace number 6, focus";
        "${mod}+Shift+7" = "move container to workspace number 7, focus";
        "${mod}+Shift+8" = "move container to workspace number 8, focus";
        "${mod}+Shift+9" = "move container to workspace number 9, focus";
        "${mod}+Shift+0" = "move container to workspace number 10, focus";

        "${mod}+w" = "mode \"split\"";
        "${mod}+e" = "mode \"layout\"";
        "${mod}+Alt+space" = "floating toggle";
        "${mod}+space" = "focus mode_toggle";
        "${mod}+Shift+Return" = "focus parent";
        "${mod}+Shift+s" = "move scratchpad";
        "${mod}+s" = "scratchpad show";
        "${mod}+r" = "mode \"resize\"";
        "${mod}+a" = "mode \"apps\"";
        "${mod}+p" = "mode \"launcher\"";
      };

      modes = {
        "split" = {
          "v" = "splith; mode \"default\"";
          "s" = "splitv; mode \"default\"";
          "Return" = "mode \"default\"";
          "Escape" = "mode \"default\"";
        };
        "layout" = {
          "s" = "layout stacking; mode \"default\"";
          "w" = "layout tabbed; mode \"default\"";
          "t" = "layout toggle split; mode \"default\"";
          "f" = "fullscreen; mode \"default\"";
          "Return" = "mode \"default\"";
          "Escape" = "mode \"default\"";
        };
        "resize" = {
          "h" = "resize shrink width 10px";
          "j" = "resize grow height 10px";
          "k" = "resize shrink height 10px";
          "l" = "resize grow width 10px";
          "Left" = "resize shrink width 10px";
          "Down" = "resize grow height 10px";
          "Up" = "resize shrink height 10px";
          "Right" = "resize grow width 10px";
          "Return" = "mode \"default\"";
          "Escape" = "mode \"default\"";
        };
        "apps" = {
          "f" = "exec ${terminal} -T yazi -a yazi ${file_manager}; mode \"default\"";
          "e" = "exec ${config.home-manager.users.drk.home.sessionVariables.VISUAL}; mode \"default\"";
          "w" = "exec ${config.home-manager.users.drk.home.sessionVariables.BROWSER}; mode \"default\"";
          "c" = "exec flatpak run org.signal.Signal; mode \"default\"";
          "x" = "exec flatpak run org.ferdium.Ferdium; mode \"default\"";
          "o" = "exec flatpak run org.libreoffice.LibreOffice; mode \"default\"";
          "n" = "exec flatpak run md.obsidian.Obsidian; mode \"default\"";
          "m" = "exec ${terminal} -T cmus -a cmus cmus; mode \"default\"";
          "r" = "exec ${terminal} -T newsboat -a newsboat newsboat; mode \"default\"";
          "p" = "exec flatpak run com.bitwarden.desktop; mode \"default\"";
          "v" = "exec flatpak run org.gnome.Boxes; mode \"default\"";
          "Shift+b" = "exec ${terminal} -T btop -a btop btop; mode \"default\"";
          "Shift+p" = "exec ${terminal} -T pulsemixer -a pulsemixer pulsemixer; mode \"default\"";
          "Return" = "mode \"default\"";
          "Escape" = "mode \"default\"";
        };
        "launcher" = {
          "d" = "exec ${menu}";
          "q" = "exec ${scripts.rs_power}";
          "e" = "exec ${scripts.rs_emoji}";
          "w" = "exec ${scripts.rs_wall}";
          "s" = "exec ${scripts.rs_scrot}";
          "b" = "exec ${scripts.rs_blue}";
          "c" = "exec ${scripts.rs_clip}";
          "i" = "exec ${scripts.rs_wifi}";
          "Return" = "mode \"default\"";
          "Escape" = "mode \"default\"";
        };
      };

      window = [
        { criteria = { class = "Cemu"; }; command = "inhibit_idle focus"; }
        { criteria = { instance = "cemu"; }; command = "inhibit_idle focus"; }
        { criteria = { app_id = "cemu"; }; command = "inhibit_idle focus"; }
        { criteria = { app_id = "rpcs3"; }; command = "inhibit_idle focus"; }
        { criteria = { app_id = "yuzu"; }; command = "inhibit_idle focus"; }
        { criteria = { class = "yuzu"; }; command = "inhibit_idle focus"; }
        { criteria = { app_id = "snes9x-gtk"; }; command = "inhibit_idle focus"; }
        { criteria = { instance = "origin.exe"; }; command = "inhibit_idle focus, floating enable, border none, fullscreen enable, shadows disable"; }
        { criteria = { instance = "gamescope"; }; command = "inhibit_idle focus, floating enable, border none, fullscreen enable, shadows disable"; }
        { criteria = { class = "dolphin-emu"; title = "Dolphin (.*) \\| (.*) \\| (.*) \\| (.*)"; }; command = "inhibit_idle focus, floating enable, border none, fullscreen enable, shadows disable"; }
        { criteria = { class = "sm64ex"; }; command = "inhibit_idle focus, floating enable, border none, fullscreen enable, shadows disable"; }
        { criteria = { class = "gamescope"; }; command = "inhibit_idle focus, floating enable, border none, fullscreen enable, shadows disable"; }
        { criteria = { class = "steam_app.*"; }; command = "inhibit_idle focus, floating enable, border none, fullscreen enable, shadows disable"; }
        { criteria = { instance = "steam_app.*"; }; command = "inhibit_idle focus, floating enable, border none, fullscreen enable, shadows disable"; }
        { criteria = { class = "LLBlaze.x86_64"; }; command = "inhibit_idle focus, floating enable, border none, fullscreen enable, shadows disable"; }
        { criteria = { app_id = "clonehero"; }; command = "inhibit_idle focus, floating enable, border none, fullscreen enable, shadows disable"; }
        { criteria = { app_id = "CombatMaster.x86_64"; }; command = "inhibit_idle focus, floating enable, border none, fullscreen enable, shadows disable, saturation set 2"; }
        { criteria = { app_id = "firefox"; title = "^Picture-in-Picture$"; }; command = "floating enable, border pixel 1, sticky enable, shadows enable"; }
        { criteria = { app_id = "stoken-gui"; }; command = "floating enable, border pixel 1, sticky enable, shadows enable"; }
        { criteria = { app_id = "org.twosheds.iwgtk"; }; command = "floating enable, border pixel 1, sticky enable, shadows enable"; }
        { criteria = { app_id = "iwgtk"; }; command = "floating enable, border pixel 1, sticky enable, shadows enable"; }
        { criteria = { app_id = "ksysguard"; }; command = "floating enable, border pixel 1, sticky enable, shadows enable"; }
        { criteria = { app_id = "galculator"; }; command = "floating enable, border pixel 1, sticky enable, shadows enable"; }
        { criteria = { title = "(?:Open|Save) (?:File|Folder|As)"; app_id = "dolphin|org.kde.ark|pcmanfm|pcmanfm-qt"; }; command = "floating enable, border pixel 1, sticky enable, shadows enable"; }
        { criteria = { title = "^(File|Folder)\\s*Already Exists\\s*—\\s*"; app_id = "dolphin|org.kde.ark|pcmanfm|pcmanfm-qt"; }; command = "floating enable, border pixel 1, sticky enable, shadows enable"; }
        { criteria = { title = "Confirm to replace files"; app_id = "dolphin|org.kde.ark|pcmanfm|pcmanfm-qt"; }; command = "floating enable, border pixel 1, sticky enable, shadows enable"; }
        { criteria = { app_id = "pavucontrol"; }; command = "floating enable, border pixel 1, sticky enable, shadows enable"; }
        { criteria = { app_id = "qtalarm"; }; command = "floating enable, border pixel 1, sticky enable, shadows enable"; }
        { criteria = { app_id = "deluge"; title = "Add Torrents*"; }; command = "floating enable, border pixel 1, sticky enable, shadows enable"; }
        { criteria = { app_id = "org.telegram.desktop"; }; command = "floating enable, blur off, shadows disable, inhibit_idle open"; }
        { criteria = { app_id = "com.github.weclaw1.ImageRoll"; }; command = "floating enable, border pixel 1, shadows enable"; }
        { criteria = { app_id = "teams-for-linux"; }; command = "floating enable, border pixel 1, shadows enable"; }
        { criteria = { app_id = "viewnior"; }; command = "floating enable, border pixel 1, shadows enable"; }
        { criteria = { instance = "viewnior"; }; command = "floating enable, border pixel 1, shadows enable"; }
        { criteria = { instance = "yakyak"; }; command = "floating enable, border pixel 1, shadows enable"; }
        { criteria = { class = "Microsoft Teams - Preview"; }; command = "floating enable, border pixel 1, shadows enable"; }
        { criteria = { class = "teams-for-linux"; }; command = "floating enable, border pixel 1, shadows enable"; }
        { criteria = { class = "Microsoft Teams - Insiders"; }; command = "floating enable, border pixel 1, shadows enable"; }
        { criteria = { app_id = "Alacritty_floating"; }; command = "floating enable, border pixel 1, shadows enable"; }
        { criteria = { title = "^Information\\s*—\\s*Dolphin"; app_id = "dolphin"; }; command = "floating enable, border pixel 1, shadows enable"; }
        { criteria = { title = "^Loading archive"; app_id = "org.kde.ark"; }; command = "floating enable, border pixel 1, shadows enable"; }
        { criteria = { instance = "crx_nckgahadagoaajjgafhacjanaoiihapd"; }; command = "floating enable, border pixel 1, shadows enable"; }
        { criteria = { title = "Preferences"; app_id = "pcmanfm-qt"; }; command = "floating enable, border pixel 1, shadows enable"; }
        { criteria = { title = "File Properties"; app_id = "pcmanfm-qt"; }; command = "floating enable, border pixel 1, shadows enable"; }
        { criteria = { app_id = "anki"; }; command = "floating enable, border pixel 1, shadows enable"; }
        { criteria = { window_role = "pop-up,task_dialog,About"; }; command = "floating enable, shadows enable"; }
        { criteria = { window_type = "dialog"; }; command = "floating enable, shadows enable"; }
        { criteria = { window_type = "utility"; }; command = "floating enable, shadows enable"; }
        { criteria = { window_type = "toolbar"; }; command = "floating enable, shadows enable"; }
        { criteria = { window_type = "splash"; }; command = "floating enable, shadows enable"; }
        { criteria = { window_type = "menu"; }; command = "floating enable, shadows enable"; }
        { criteria = { window_type = "dropdown_menu"; }; command = "floating enable, shadows enable"; }
        { criteria = { window_type = "popup_menu"; }; command = "floating enable, shadows enable"; }
        { criteria = { window_type = "tooltip"; }; command = "floating enable, shadows enable"; }
        { criteria = { window_type = "notification"; }; command = "floating enable, shadows enable"; }
        { criteria = { title = "Move files"; app_id = "dolphin|org.kde.ark|pcmanfm|pcmanfm-qt"; }; command = "inhibit_idle open, floating enable, border pixel 1"; }
        { criteria = { title = "^(Copying|Moving)\\s*—\\s*Dolphin"; app_id = "dolphin|org.kde.ark|pcmanfm|pcmanfm-qt"; }; command = "inhibit_idle open, floating enable, border pixel 1"; }
        { criteria = { title = "^Extracting\\s"; app_id = "(dolphin|org.kde.ark)"; }; command = "inhibit_idle open, floating enable, border pixel 1"; }
        { criteria = { title = "Copy Files"; app_id = "dolphin|org.kde.ark|pcmanfm|pcmanfm-qt"; }; command = "inhibit_idle open, floating enable, border pixel 1"; }
        { criteria = { title = "Delete Files"; app_id = "dolphin|org.kde.ark|pcmanfm|pcmanfm-qt"; }; command = "inhibit_idle open, floating enable, border pixel 1"; }
        { criteria = { title = "Removable medium is inserted"; app_id = "pcmanfm|pcmanfm-qt"; }; command = "inhibit_idle open, floating enable, border pixel 1"; }
        { criteria = { title = "Compressing (.*) — Ark"; app_id = "org.kde.ark"; }; command = "inhibit_idle open, floating enable, border pixel 1, resize set width 18 ppt"; }
        { criteria = { title = "MAX - Chromium"; instance = "chromium"; }; command = "inhibit_idle visible, floating enable, sticky enable, border pixel 1"; }
        { criteria = { title = "MAX - Chromium"; app_id = "chromium"; }; command = "inhibit_idle visible, floating enable, sticky enable, border pixel 1"; }
        { criteria = { title = "MAX - Chromium"; app_id = "chromium"; urgent = "recent"; }; command = "inhibit_idle visible, floating enable, sticky enable, border pixel 1, focus, move position center"; }
        { criteria = { title = "https://max.niceincontact.com/index.html - Chromium"; instance = "chromium"; }; command = "inhibit_idle visible, floating enable, sticky enable, border pixel 1"; }
        { criteria = { title = "https://max.niceincontact.com/index.html - Chromium"; app_id = "chromium"; }; command = "inhibit_idle visible, floating enable, sticky enable, border pixel 1"; }
        { criteria = { title = "https://max.niceincontact.com/index.html - Chromium"; app_id = "chromium"; urgent = "latest"; }; command = "inhibit_idle visible, floating enable, sticky enable, border pixel 1, focus, move position center"; }
        { criteria = { class = "steam"; }; command = "floating enable, max_render_time off, blur disabled"; }
        { criteria = { class = "wgc.exe"; }; command = "floating enable, max_render_time off, blur disabled"; }
        { criteria = { app_id = "org.telegram.desktop"; title = "Telegram"; }; command = "floating disable, inhibit_idle none"; }
        { criteria = { urgent = "latest"; }; command = "focus"; }
        { criteria = { floating = "true"; }; command = "shadows enable"; }
        { criteria = { app_id = "alacritty"; }; command = "saturation set 2, blur enable"; }
        { criteria = { app_id = "firefox"; title = "Firefox — Sharing Indicator"; }; command = "floating enable, kill"; }
        { criteria = { title = "Wine System Tray"; }; command = "floating enable, kill"; }
        { criteria = { title = "Android Emulator - *"; }; command = "floating enable, border normal"; }
        { criteria = { title = "Emulator"; window_type = "utility"; }; command = "move scratchpad"; }
        { criteria = { app_id = "brave-nngceckbapebfimnlniiiahkandclblb-Default"; }; command = "floating enable"; }
        { criteria = { title = "Extension: (Bitwarden Password Manager) - Bitwarden — Mozilla Firefox"; }; command = "floating enable"; }
        { criteria = { title = "Extension: (Bitwarden Password Manager) - Bitwarden — Zen Browser"; }; command = "floating enable"; }
        { criteria = { title = "Open File"; }; command = "floating enable"; }
        { criteria = { title = "About"; }; command = "floating enable"; }
        { criteria = { app_id = "xdg-desktop-portal-gtk"; }; command = "floating enable"; }
        { criteria = { app_id = "qalculate-gtk"; }; command = "floating enable"; }
        { criteria = { app_id = "com.nextcloud.desktopclient.nextcloud"; }; command = "floating enable"; }
      ];

      startup = [
        { command = "${pkgs.xdg-desktop-portal-wlr}/bin/xdg-desktop-portal-wlr"; always = true; }
        { command = "${pkgs.xdg-desktop-portal-gtk}/bin/xdg-desktop-portal-gtk"; always = true; }
        { command = "${pkgs.polkit_gnome}/lib/polkit-gnome/polkit-gnome-authentication-agent-1"; always = true; }
        { command = "startidle"; always = true; }
        { command = "sway-audio-idle-inhibit"; always = true; }
        { command = "fnott"; always = true; }
        { command = "wl-paste --type text --watch cliphist store"; always = true; }
        { command = "wl-paste --type image --watch cliphist store"; always = true; }
        { command = "dex -a -s ~/.config/autostart"; always = true; }
        { command = "mkfifo /tmp/wobpipe && tail -f /tmp/wobpipe | wob -c ~/.config/wob/wob.ini"; always = true; }
        { command = "${scripts.nextinit}"; always = true; }
        { command = "pidof kanshi && kill -1 $(pidof kanshi) || kanshi"; always = true; }
        { command = "gtk-update-icon-cache"; always = true; }
      ];
    };
  };

  # GNOME Polkit Agent
  services.polkit-gnome.enable = true;
}

