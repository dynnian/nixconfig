{ pkgs, lib, hostname, ... }:
let
  isLaptop = hostname == "claymore" || hostname == "workpad";
in {
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;

    settings = {
      mainBar = {
        position = "top";
        height = 25;
        layer = "top";

        modules-left = [
          "sway/workspaces"
          "sway/mode"
          "sway/scratchpad"
          "sway/window"
        ];

        modules-right =
          [
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
          ]
          ++ lib.optionals isLaptop [
            "battery"
            "battery#bat2"
          ]
          ++ [
            "custom/arrow5"
            "pulseaudio"
          ]
          ++ lib.optionals isLaptop [
            "custom/arrow6"
            "backlight"
          ]
          ++ [
            "custom/arrow7"
            "network"
            "bluetooth"
          ];

        "sway/workspaces" = {
          on-click = "activate";
          sort-by-number = true;
          format = "{icon}";
          format-icons = {
            "1"  = "󰬺";
            "2"  = "󰬻";
            "3"  = "󰬼";
            "4"  = "󰬽";
            "5"  = "󰬾";
            "6"  = "󰬿";
            "7"  = "󰭀";
            "8"  = "󰭁";
            "9"  = "󰭂";
            "10" = "󰿩";
          };
        };

        "sway/mode" = {
          format = "<span style=\"italic\">{}</span>";
        };

        "sway/scratchpad" = {
          format = "{icon} {count}";
          show-empty = false;
          format-icons = [
            ""
            ""
          ];
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

        "tray" = { icon-size = 16; spacing = 10; };

        "cpu" = {
          interval = 1;
          format = " {usage}%";
          on-click = "foot -T btop -a btop btop";
        };

        "memory" = {
          interval = 1;
          format = " {percentage}%";
          on-click = "foot -T btop -a btop btop";
        };

        "sway/language" = {
          format = "󰌌 {}";
          on-click = "swaymsg input type:keyboard xkb_switch_layout next";
          tooltip = false;
        };

        "pulseaudio" = {
          scroll-step = 1;
          tooltip-format = "{volume}% - {desc}";
          format = "{icon} {format_source}";
          format-bluetooth = "{icon} {format_source}";
          format-bluetooth-muted = "󰝟 {icon} {format_source}";
          format-muted = "󰝟 {format_source}";
          format-source = "󰍬";
          format-source-muted = "󰍭";
          format-icons = {
            headphone = "󰋋";
            "hands-free" = "󱡏";
            headset = "󰋎";
            phone = "";
            portable = "󰓃";
            car = "󰄋";
            default = [ "󰕿" "󰖀" "󰕾" ];
          };
          on-click = "foot -T pulsemixer -e pulsemixer pulsemixer";
        };

        "backlight" = {
          format = "{icon}";
          format-icons = [
            "󱩎" "󱩏" "󱩐" "󱩑" "󱩒" "󱩓" "󱩔" "󱩕" "󰛨"
          ];
          tooltip-format = "{percent}%";
        };

        "idle_inhibitor" = {
          format = "{icon}";
          format-icons = { activated = ""; deactivated = ""; };
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
          format-charging = "{icon} 󰚥";
          format-plugged = "{icon} 󰚥";
          format-critical = "{icon} 󱈸";
          format-warning = "{icon} 󱈸";
          format-icons = [ "󰁺" "󰁼" "󰁾" "󰂀" "󰁹" ];
          tooltip-format = "{capacity}% - {timeTo}";
          on-click = "rs_power";
        };

        "battery#bat2" = {
          bat = "BAT1";
          states = { warning = 30; critical = 15; };
          format = "{icon}";
          format-charging = "{icon} 󰚥";
          format-plugged = "{icon} 󰚥";
          format-critical = "{icon} 󱈸";
          format-warning = "{icon} 󱈸";
          format-icons = [ "󰁺" "󰁼" "󰁾" "󰂀" "󰁹" ];
          tooltip-format = "{capacity}% - {timeTo}";
          on-click = "rs_power";
        };

        "network" = {
          format-wifi = "󰖩";
          format-ethernet = "󰈀";
          format-disconnected = "󰅛";
          tooltip-format = "({essid} - {signalStrength}%) - {ifname}: {ipaddr}/{cidr}";
          on-click = "rs_wifi";
        };

        "bluetooth" = {
          format = "󰂲";
          format-on = "󰂯";
          format-off = "󰂲";
          format-disabled = "󰂲";
          format-connected = "󰂱";
          tooltip-format = "{controller_alias}\t{controller_address} ON";
          tooltip-format-on = "{controller_alias}\t{controller_address} ON";
          tooltip-format-off = "{controller_alias}\t{controller_address} OFF";
          tooltip-format-disabled = "{controller_alias}\t{controller_address} OFF";
          tooltip-format-connected =
            "{controller_alias}\t{controller_address} ON\n\n{num_connections} connected\n\n{device_enumerate}";
          tooltip-format-enumerate-connected =
            "{device_alias}\t{device_address}";
          tooltip-format-enumerate-connected-battery =
            "{device_alias}\t{device_address}\t{device_battery_percentage}%";
          on-click = "rs_blue";
          on-click-right = "bluetoothctl disconnect";
          on-click-middle = "bluetoothctl power off";
        };

        "clock" = {
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format = "󰥔 {:%H:%M}";
          format-alt = "󰃵 {:%Y-%m-%d}";
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
      /* Gruvbox Dark palette */
      @define-color white    #fbf1c7;
      @define-color black    #1d2021;
      @define-color red      #cc241d;
      @define-color green    #98971a;
      @define-color yellow   #d79921;
      @define-color orange   #d65d0e;
      @define-color blue     #458588;
      @define-color purple   #b16286;
      @define-color aqua     #689d6a;
      @define-color gray     #a89984;

      @define-color brwhite  #ebdbb2;
      @define-color brblack  #504945;
      @define-color brgray   #928374;
      @define-color brred    #fb4934;
      @define-color brgreen  #b8bb26;
      @define-color bryellow #fabd2f;
      @define-color brorange #fe8019;
      @define-color brblue   #83a598;
      @define-color brpurple #d3869b;
      @define-color braqua   #8ec07c;

      @define-color drred    #9d0006;
      @define-color drgreen  #79740e;
      @define-color drpurple #8f3f71;
      @define-color drorange #af3a03;
      @define-color drgray   #3c3836;
      @define-color drblue   #076678;
      @define-color draqua   #427b58;
      @define-color dryellow #b57614;

      /* Module colors */
      @define-color critical     @brred;
      @define-color unfocused    @braqua;
      @define-color focused      @red;
      @define-color inactive     @gray;
      @define-color clock        @purple;
      @define-color monitor      @blue;
      @define-color language     @aqua;
      @define-color idle         @green;
      @define-color powerprofile @green;
      @define-color battery      @green;
      @define-color volume       @yellow;
      @define-color backlight    @orange;
      @define-color network      @red;
      @define-color wbackground  rgba(29, 32, 33, 0.90);

      @keyframes blink { to { color: @critical; } }

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
      button:hover { background: inherit; }

      window#waybar {
        background-color: @wbackground;
        font-family: Symbols Nerd Font Mono, Mononoki Nerd Font;
        font-size: 14px;
      }

      #workspaces button {
        font-family: Symbols Nerd Font Mono;
        font-size: 16px;
        padding: 0px 0px;
        margin: 0 0;
        color: @white;
      }
      #workspaces button.visible   { color: @white; }
      #workspaces button.unfocused { color: @white; }
      #workspaces button.focused   { color: @wbackground; background: @focused; }
      #workspaces button.urgent    { color: @wbackground; background: @critical; }
      #workspaces button:hover     { background: @yellow; color: @black; }

      #mode {
        color: @wbackground;
        background-color: @red;
        border-bottom: 3px solid @white;
        padding: 3px;
      }

      #window {
        color: @white;
        padding: 0 10px;
        margin: 5px 0;
      }

      #window, #workspaces { margin: 0 4px; }
      .modules-left  > widget:first-child > #workspaces { margin-left: 0; }
      .modules-right > widget:last-child  > #workspaces { margin-right: 0; }

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

      #clock                 { background-color: @clock; }
      #cpu, #memory          { background-color: @monitor; }
      #language              { background-color: @language; }
      #idle_inhibitor        { background-color: @battery; }
      #power-profiles-daemon { background-color: @powerprofile; }

      #battery,
      #battery.charging,
      #battery.plugged { background-color: @battery; }

      #battery.critical:not(.charging) {
        color: @white;
        animation: blink 0.5s linear infinite alternate;
      }

      #network,
      #network.disconnected { background-color: @network; }

      #bluetooth,
      #bluetooth.disconnected {
        background-color: @network;
        padding-right: 10px;
      }

      #pulseaudio,
      #pulseaudio.muted { background-color: @volume; }

      #backlight { background-color: @backlight; }

      #custom-arrow1,
      #custom-arrow2,
      #custom-arrow3,
      #custom-arrow4,
      #custom-arrow5,
      #custom-arrow6,
      #custom-arrow7 { font-size: 20pt; }

      #custom-arrow1 { background: transparent; color: @clock; }
      #custom-arrow2 { background: @clock;      color: @monitor; }
      #custom-arrow3 { background: @monitor;    color: @language; }
      #custom-arrow4 { background: @language;   color: @battery; }
      #custom-arrow5 { background: @battery;    color: @volume; }
      #custom-arrow6 { background: @volume;     color: @backlight; }
      #custom-arrow7 { 
        background: ${if isLaptop then "@backlight" else "@volume"};
        color: @network; 
      }
    '';
  };
}
