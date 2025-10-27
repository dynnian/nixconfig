{ config, pkgs, ... }: {
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    settings = {
      mainBar = {
        position = "top";
        height = 25;
        layer = "top";

        modules-left = [
          "hyprland/workspaces"
          "hyprland/window"
        ];

        modules-right = [
          "tray"
          "custom/arrow1"
          "clock"
          "custom/arrow2"
          "cpu"
          "memory"
          "custom/arrow3"
          "hyprland/language"
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

        "hyprland/workspaces" = {
          on-click = "activate";
          sort-by-number = true;
          on-scroll-up = "hyprctl dispatch workspace e+1";
          on-scroll-down = "hyprctl dispatch workspace e-1";
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

        "hyprland/window" = {
          format = "{title}";
          icon = true;
          icon-size = 16;
          separate-outputs = true;
        };

        "tray" = {
          icon-size = 16;
          spacing = 10;
        };

        "cpu" = {
          interval = 1;
          format = "\uf4bc {usage}%";
          on-click = "kitty --class btop btop";
        };

        "memory" = {
          interval = 1;
          format = "\uefc5 {percentage}%";
          on-click = "kitty --class btop btop";
        };

        "hyprland/language" = {
          format = "\udb80\udf0c {}";
          format-en = "US";
          format-es = "ES";
          on-click = "hyprctl switchxkblayout at-translated-set-2-keyboard next";
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
          on-click = "kitty --class audiomixer pulsemixer";
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
          on-click = "rs_power";
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
          on-click = "rs_power";
        };

        "network" = {
          format-wifi = "\udb81\udda9";
          format-ethernet = "\udb80\ude00";
          format-disconnected = "\udb80\udd5b";
          tooltip-format = "({essid} - {signalStrength}%) - {ifname}: {ipaddr}/{cidr}";
          on-click = "rs_wifi";
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
          on-click = "rs_blue";
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
    style = ''
      @define-color white     #cdd6f4;
      @define-color black     #1e1e2e;
      @define-color red       #e78284;
      @define-color green     #a6d189;
      @define-color yellow    #e5c890;
      @define-color orange    #ef9f76;
      @define-color blue      #8caaee;
      @define-color purple    #ca9ee6;
      @define-color aqua      #81c8be;
      @define-color gray      #313244;
      @define-color brred     #f38ba8;
      @define-color brgreen   #a6e3a1;
      @define-color brpurple  #cba6f7;
      @define-color brorange  #fab387;
      @define-color brgray    #45475a;
      @define-color brblue    #89b4fa;
      @define-color braqua    #94e2d5;
      @define-color bryellow  #f9e2af;
      @define-color critical              @brred;
      @define-color unfocused             @braqua;
      @define-color focused               @brblue;
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
      @define-color wbackground           rgba(30, 30, 46, 0.90);
      @keyframes blink {
          to {
              color: @critical;
          }
      }
      * {
          border: none;
          border-radius: 0;
          min-height: 0;
          padding: 0;
          box-shadow: none;
          text-shadow: none;
      }
      button {
          box-shadow: inset 0 -3px transparent;
          border: none;
          border-radius: 0;
      }
      button:hover {
          background: inherit;
      }
      window#waybar {
          background-color: @wbackground;
          font-family:
              Symbols Nerd Font Mono,
              Mononoki Nerd Font;
          font-size: 14px;
      }
      #workspaces button {
          border-top: 2px solid @inactive;
          padding: 0 4px;
          color: @white;
      }
      #workspaces button.active {
          background-color: @inactive;
          border-top: 2px solid @focused;
          color: @focused;
          transition-property: color;
          transition-duration: 0.5s;
      }
      #workspaces button:hover {
          color: @unfocused;
          transition-property: color;
          transition-duration: 0.5s;
      }
      #workspaces button.urgent {
          background-color: @inactive;
          animation-name: blink;
          animation-duration: 0.5s;
          animation-timing-function: linear;
          animation-iteration-count: 3;
          animation-direction: alternate;
      }
      #window {
          color: @white;
          padding: 0 10px;
      }
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
          color: @wbackground;
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
      #battery.critical:not(.charging),
      #battery#bat2.critical:not(.charging) {
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
      #custom-arrow1,
      #custom-arrow2,
      #custom-arrow3,
      #custom-arrow4,
      #custom-arrow5,
      #custom-arrow6,
      #custom-arrow7 {
          font-size: 18pt;
      }
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
  };
}