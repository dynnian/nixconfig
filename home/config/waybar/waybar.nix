{ config, pkgs, ... }:
{
  programs.waybar.enable = true;

  programs.waybar.settings = {
    mainBar = {
      reload-style-on-change = true;
      position = "top";
      height = 28;
      spacing = 0;
      layer = "top";

      modules-left = [
        "sway/workspaces"
        "sway/mode"
        "sway/scratchpad"
        "sway/window"
      ];

      modules-right = [
        "tray"
        "custom/arrow1"
        "clock"
        "custom/arrow2"
        "cpu"
        "memory"
        "custom/arrow3"
        "sway/language"
        "custom/arrow4"
        "idle_inhibitor"
        "power-profiles-daemon"
        "battery"
        "battery#bat2"
        "custom/arrow5"
        "pulseaudio"
        "custom/arrow6"
        "backlight"
        "custom/arrow7"
        "network"
        "bluetooth"
      ];

      # =============================
      # Modules Configuration
      # =============================

      "sway/workspaces" = {
        on-click = "activate";
        sort-by-number = true;
        format = "{icon}";
        format-icons = {
          "1" = "\udb82\udf3a";
          "2" = "\udb82\udf3b";
          "3" = "\udb82\udf3c";
          "4" = "\udb82\udf3d";
          "5" = "\udb82\udf3e";
          "6" = "\udb82\udf3f";
          "7" = "\udb82\udf40";
          "8" = "\udb82\udf41";
          "9" = "\udb82\udf42";
          "10" = "\udb83\udfe9";
        };
      };

      "sway/mode" = {
        format = "<span style=\"italic\">{}</span>";
      };

      "sway/scratchpad" = {
        format = "{icon} {count}";
        show-empty = false;
        format-icons = [ "" "\uf2d2" ];
        tooltip = true;
        tooltip-format = "{app}: {title}";
      };

      "sway/window" = {
        tooltip = false;
        format = "{title}";
        icon = true;
        icon-size = 16;
        max-length = 60;
      };

      "tray" = {
        icon-size = 16;
        spacing = 10;
      };

      "cpu" = {
        interval = 1;
        format = "\uf4bc {usage}%";
        on-click = "foot -T btop -a btop btop";
      };

      "memory" = {
        interval = 1;
        format = "\uefc5 {percentage}%";
        on-click = "foot -T btop -a btop btop";
      };

      "sway/language" = {
        format = "\udb80\udf0c {}";
        on-click = "swaymsg input type:keyboard xkb_switch_layout next";
        tooltip = false;
      };

      "pulseaudio" = {
        scroll-step = 1;
        tooltip-format = "{volume}% - {desc}";
        format = "{icon} {format_source}";
        format-bluetooth = "{icon}\udb80\udcaf {format_source}";
        format-bluetooth-muted = "\udb81\udd81 {icon}\udb80\udcaf {format_source}";
        format-muted = "\udb81\udd81 {format_source}";
        format-source = "\udb80\udf6c";
        format-source-muted = "\udb80\udf6d";
        format-icons = {
          headphone = "\udb80\udecb";
          "hands-free" = "\udb86\udc4f";
          headset = "\udb80\udece";
          phone = "\udb80\udff2";
          portable = "\udb80\udff2";
          car = "\udb80\udd0b";
          default = [ "\udb81\udd7f" "\udb81\udd80" "\udb81\udd7e" ];
        };
        on-click = "foot -T audiomixer -a audiomixer pulsemixer";
      };

      "backlight" = {
        format = "{icon}";
        format-icons = [
          "\udb86\ude4e" "\udb86\ude4f" "\udb86\ude50" "\udb86\ude51"
          "\udb86\ude52" "\udb86\ude53" "\udb86\ude54" "\udb86\ude55"
          "\udb81\udee8"
        ];
        tooltip-format = "{percent}%";
      };

      "idle_inhibitor" = {
        format = "{icon}";
        format-icons = {
          activated = "\uea71";
          deactivated = "\ueabc";
        };
      };

      "power-profiles-daemon" = {
        format = "{icon}";
        tooltip-format = "Power profile: {profile}";
        tooltip = true;
        format-icons = {
          default = "󰾅";
          performance = "󰓅";
          balanced = "󰾅";
          "power-saver" = "󰾆";
        };
      };

      "battery" = {
        bat = "BAT0";
        states = { warning = 30; critical = 15; };
        format = "{icon}";
        format-charging = "{icon} \udb81\udea5";
        format-plugged = "{icon} \udb81\udea5";
        format-critical = "{icon} \udb84\ude38";
        format-warning = "{icon} \udb84\ude38";
        format-icons = [
          "\udb80\udc7a" "\udb80\udc7c" "\udb80\udc7e" "\udb80\udc80" "\udb80\udc79"
        ];
        tooltip-format = "{capacity}% - {timeTo}";
        #on-click = "$HOME/.config/rofi/scripts/rs_power";
      };

      "battery#bat2" = {
        bat = "BAT1";
        states = { warning = 30; critical = 15; };
        format = "{icon}";
        format-charging = "{icon} \udb81\udea5";
        format-plugged = "{icon} \udb81\udea5";
        format-critical = "{icon} \udb84\ude38";
        format-warning = "{icon} \udb84\ude38";
        format-icons = [
          "\udb80\udc7a" "\udb80\udc7c" "\udb80\udc7e" "\udb80\udc80" "\udb80\udc79"
        ];
        tooltip-format = "{capacity}% - {timeTo}";
        #on-click = "$HOME/.config/fuzzel/scripts/rs_power";
      };

      "network" = {
        format-wifi = "\udb81\udda9";
        format-ethernet = "\udb80\ude00";
        format-disconnected = "\udb80\udd5b";
        tooltip-format = "({essid} - {signalStrength}%) - {ifname}: {ipaddr}/{cidr}";
        #on-click = "$HOME/.config/fuzzel/scripts/rs_wifi";
      };

      "bluetooth" = {
        format = "\udb80\udcb2";
        format-on = "\udb80\udcaf";
        format-off = "\udb80\udcb2";
        format-disabled = "\udb80\udcb2";
        format-connected = "\udb80\udcb1";
        tooltip-format = "{controller_alias}\t{controller_address} ON";
        tooltip-format-on = "{controller_alias}\t{controller_address} ON";
        tooltip-format-off = "{controller_alias}\t{controller_address} OFF";
        tooltip-format-disabled = "{controller_alias}\t{controller_address} OFF";
        tooltip-format-connected =
          "{controller_alias}\t{controller_address} ON\n\n{num_connections} connected\n\n{device_enumerate}";
        tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
        tooltip-format-enumerate-connected-battery =
          "{device_alias}\t{device_address}\t{device_battery_percentage}%";
        #on-click = "$HOME/.config/fuzzel/scripts/rs_blue";
        on-click-right = "bluetoothctl disconnect";
        on-click-middle = "bluetoothctl power off";
      };

      "clock" = {
        tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        format = "\udb82\udd54 {:%H:%M}";
        format-alt = "\udb80\udcf5 {:%Y-%m-%d}";
      };

      "custom/arrow1" = { format = ""; tooltip = false; };
      "custom/arrow2" = { format = ""; tooltip = false; };
      "custom/arrow3" = { format = ""; tooltip = false; };
      "custom/arrow4" = { format = ""; tooltip = false; };
      "custom/arrow5" = { format = ""; tooltip = false; };
      "custom/arrow6" = { format = ""; tooltip = false; };
      "custom/arrow7" = { format = ""; tooltip = false; };
    };
  };

  # =============================
  # CSS Style (inline)
  # =============================
  programs.waybar.style = ''
    /* =====================================
       Colors (Gruvbox Dark)
       ===================================== */
    @define-color white     #fbf1c7;
    @define-color black     #1d2021;
    @define-color red       #cc241d;
    @define-color green     #98971a;
    @define-color yellow    #d79921;
    @define-color orange    #d65d0e;
    @define-color blue      #458588;
    @define-color purple    #b16286;
    @define-color aqua      #689d6a;
    @define-color gray      #a89984;
    /* Brighter variants */
    @define-color brwhite   #ebdbb2;
    @define-color brblack   #504945;
    @define-color brgray    #928374;
    @define-color brred     #fb4934;
    @define-color brgreen   #b8bb26;
    @define-color bryellow  #fabd2f;
    @define-color brorange  #fe8019;
    @define-color brblue    #83a598;
    @define-color brpurple  #d3869b;
    @define-color braqua    #8ec07c;
    /* Darker variants */
    @define-color drred     #9d0006;
    @define-color drgreen   #79740e;
    @define-color drpurple  #8f3f71;
    @define-color drorange  #af3a03;
    @define-color drgray    #3c3836;
    @define-color drblue    #076678;
    @define-color draqua    #427b58;
    @define-color dryellow  #b57614;
    
    /* =====================================
       Color Definitions for Modules
       ===================================== */
    @define-color critical              @brred;
    @define-color unfocused             @braqua;
    @define-color focused               @red;
    @define-color inactive              @gray;
    @define-color clock                 @purple;
    @define-color monitor               @blue;
    @define-color language              @aqua;
    @define-color idle                  @green;
    @define-color powerprofile          @green;
    @define-color battery               @green;
    @define-color volume                @yellow;
    @define-color backlight             @orange;
    @define-color network               @red;
    @define-color wbackground           rgba(29, 32, 33, 0.90);
    
    /* =====================================
       Keyframes
       ===================================== */
    @keyframes blink {
        to {
            color: @critical;
        }
    }
    
    /* =====================================
       Reset Styles
       ===================================== */
    * {
        border: none;
        border-radius: 0;
        min-height: 0;
        padding: 0;
        box-shadow: none;
        text-shadow: none;
    }
    
    /* =====================================
       Button Styles
       ===================================== */
    button {
        box-shadow: inset 0 -3px transparent;
        border: none;
        border-radius: 0;
    }
    
    /* Prevent strange hover effect on workspace buttons */
    button:hover {
        background: inherit;
    }
    
    /* =====================================
       General Bar Styles
       ===================================== */
    window#waybar {
        background-color: @wbackground;
        font-family: Symbols Nerd Font Mono, Mononoki Nerd Font;
        font-size: 14px;
    }
    
    /* =====================================
       Workspaces Module
       ===================================== */
    #workspaces button {
        font-family: Symbols Nerd Font Mono;
        font-size: 16px;
        padding: 0px 0px;
        margin: 0 0;
        color: @white;
    }
    
    #workspaces button.visible {
        color: @white;
    }
    
    #workspaces button.focused {
        color: @wbackground;
        background: @focused;
    }
    
    #workspaces button.unfocused {
        color: @white;
    }
    
    #workspaces button.urgent {
        color: @wbackground;
        background: @critical;
    }
    
    #workspaces button:hover {
        background: @yellow;
        color: @black;
    }
    
    /* =====================================
       Mode Module
       ===================================== */
    #mode {
        color: @wbackground;
        background-color: @red;
        border-bottom: 3px solid @white;
        padding: 3px;
    }
    
    /* =====================================
       Window Module
       ===================================== */
    #window {
        color: @white;
        padding: 0 10px;
        margin: 5px 0;
    }
    
    /* =====================================
       Margins and Layout Adjustments
       ===================================== */
    #window, #workspaces {
        margin: 0 4px;
    }
    
    .modules-left > widget:first-child > #workspaces {
        margin-left: 0;
    }
    
    .modules-right > widget:last-child > #workspaces {
        margin-right: 0;
    }
    
    /* =====================================
       Individual Module Styles
       ===================================== */
    #cpu,
    #memory,
    #language,
    #idle_inhibitor,
    #power-profiles-daemon,
    #battery,
    #pulseaudio,
    #backlight,
    #network,
    #bluetooth,
    #clock {
        color: @white;
        padding-left: 4px;
    }
    
    #clock {
        background-color: @clock;
    }
    
    #cpu {
        background-color: @monitor;
    }
    
    #memory {
        background-color: @monitor;
    }
    
    #language {
        background-color: @language;
    }
    
    #idle_inhibitor {
        background-color: @battery;
    }
    
    #power-profiles-daemon {
        background-color: @powerprofile;
    }
    
    #battery,
    #battery.charging,
    #battery.plugged {
        background-color: @battery;
    }
    
    #battery.critical:not(.charging) {
        color: @white;
        animation: blink 0.5s linear infinite alternate;
    }
    
    #network,
    #network.disconnected {
        background-color: @network;
    }
    
    #bluetooth,
    #bluetooth.disconnected {
        background-color: @network;
        padding-right: 10px;
    }
    
    #pulseaudio,
    #pulseaudio.muted {
        background-color: @volume;
    }
    
    #backlight {
        background-color: @backlight;
    }
    
    /* =====================================
       Modeline Arrows
       ===================================== */
    #custom-arrow1,
    #custom-arrow2,
    #custom-arrow3,
    #custom-arrow4,
    #custom-arrow5,
    #custom-arrow6,
    #custom-arrow7 {
        font-size: 20pt;
    }
    
    /* Individual Modeline Arrow Styles */
    #custom-arrow1 {
        background: transparent;
        color: @clock;
    }
    
    #custom-arrow2 {
        background: @clock;
        color: @monitor;
    }
    
    #custom-arrow3 {
        background: @monitor;
        color: @language;
    }
    
    #custom-arrow4 {
        background: @language;
        color: @battery;
    }
    
    #custom-arrow5 {
        background: @battery;
        color: @volume;
    }
    
    #custom-arrow6 {
        background: @volume;
        color: @backlight;
    }
    
    #custom-arrow7 {
        background: @backlight;
        color: @network;
    }
  '';
}

