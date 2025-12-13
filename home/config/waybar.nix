{ config, pkgs, lib, hostname, ... }:
let
  palette = config.lib.stylix.colors;
  normalize = v: if lib.hasPrefix "#" v then v else "#${v}";
  hex = {
    rosewater = normalize palette.base06;
    flamingo = normalize palette.base0F;
    pink = normalize palette.base0F;
    mauve = normalize palette.base0E;
    red = normalize palette.base08;
    maroon = normalize palette.base0F;
    peach = normalize palette.base09;
    yellow = normalize palette.base0A;
    green = normalize palette.base0B;
    teal = normalize palette.base0C;
    sky = normalize palette.base0D;
    sapphire = normalize palette.base0D;
    blue = normalize palette.base0D;
    lavender = normalize palette.base07;
    text = normalize palette.base05;
    subtext1 = normalize palette.base07;
    subtext0 = normalize palette.base06;
    overlay2 = normalize palette.base04;
    overlay1 = normalize palette.base03;
    overlay0 = normalize palette.base02;
    surface2 = normalize palette.base04;
    surface1 = normalize palette.base03;
    surface0 = normalize palette.base02;
    base = normalize palette.base00;
    mantle = normalize palette.base01;
    crust = normalize palette.base00;
  };
  hexA = name: alpha:
    let
      base = lib.removePrefix "#" hex.${name};
      n = builtins.floor (alpha * 255);
      digits = "0123456789abcdef";
      hi = builtins.substring (builtins.floor (n / 16)) 1 digits;
      lo = builtins.substring (n - (builtins.floor (n / 16) * 16)) 1 digits;
    in "#${base}${hi}${lo}";

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
          "hyprland/workspaces"
          "hyprland/window"
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
            "hyprland/language"
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

        "hyprland/workspaces" = {
          on-click = "activate";
          sort-by-number = true;
          on-scroll-up = "hyprctl dispatch workspace e+1";
          on-scroll-down = "hyprctl dispatch workspace e-1";
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

        "hyprland/window" = {
          format = "{title}";
          icon = true;
          icon-size = 16;
          separate-outputs = true;
        };

        "tray" = { icon-size = 16; spacing = 10; };

        "cpu" = {
          interval = 1;
          format = " {usage}%";
          on-click = "kitty --class btop btop";
        };

        "memory" = {
          interval = 1;
          format = " {percentage}%";
          on-click = "kitty --class btop btop";
        };

        "hyprland/language" = {
          format = "󰌌 {}";
          format-en = "US";
          format-es = "ES";
          on-click = "hyprctl switchxkblayout at-translated-set-2-keyboard next";
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
          on-click = "kitty --class audiomixer pulsemixer";
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
      @define-color white     ${hex.text};
      @define-color black     ${hex.base};
      @define-color red       ${hex.red};
      @define-color green     ${hex.green};
      @define-color yellow    ${hex.yellow};
      @define-color orange    ${hex.peach};
      @define-color blue      ${hex.blue};
      @define-color purple    ${hex.mauve};
      @define-color aqua      ${hex.teal};
      @define-color gray      ${hex.surface0};

      @define-color brred     ${hex.red};
      @define-color brgreen   ${hex.green};
      @define-color brpurple  ${hex.mauve};
      @define-color brorange  ${hex.peach};
      @define-color brgray    ${hex.surface1};
      @define-color brblue    ${hex.blue};
      @define-color braqua    ${hex.teal};
      @define-color bryellow  ${hex.yellow};

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

      @define-color wbackground           ${hexA "base" 0.90};

      @keyframes blink { to { color: @critical; } }

      * { border: none; border-radius: 0; min-height: 0; padding: 0; box-shadow: none; text-shadow: none; }
      button { box-shadow: inset 0 -3px transparent; border: none; border-radius: 0; }
      button:hover { background: inherit; }

      window#waybar {
        background-color: @wbackground;
        font-family: Symbols Nerd Font Mono, ${config.stylix.fonts.monospace.name};
        font-size: ${toString config.stylix.fonts.sizes.applications}px;
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
        animation: blink 0.5s linear 0s 3 alternate;
      }

      #window { color: @white; padding: 0 10px; }

      #cpu, #memory, #language, #idle_inhibitor, #power-profiles-daemon,
      #battery, #pulseaudio, #backlight, #network, #bluetooth, #clock {
        color: @wbackground;
        padding-left: 4px;
      }

      #clock { background-color: @clock; }
      #cpu, #memory { background-color: @monitor; }
      #language { background-color: @language; }
      #idle_inhibitor { background-color: @battery; }
      #power-profiles-daemon { background-color: @powerprofile; }
      #battery, #battery.charging, #battery.plugged { background-color: @battery; }

      #battery.critical:not(.charging),
      #battery#bat2.critical:not(.charging) {
        color: @white;
        animation: blink 0.5s linear infinite alternate;
      }

      #network, #network.disconnected { background-color: @network; }
      #bluetooth, #bluetooth.disconnected { background-color: @network; padding-right: 10px; }
      #pulseaudio, #pulseaudio.muted { background-color: @volume; }
      #backlight { background-color: @backlight; }

      #custom-arrow1, #custom-arrow2, #custom-arrow3, #custom-arrow4,
      #custom-arrow5, #custom-arrow6, #custom-arrow7 { font-size: 18pt; }

      #custom-arrow1 { background: transparent; color: @clock; }
      #custom-arrow2 { background: @clock; color: @monitor; }
      #custom-arrow3 { background: @monitor; color: @language; }
      #custom-arrow4 { background: @language; color: @battery; }
      #custom-arrow5 { background: @battery; color: @volume; }
      #custom-arrow6 { background: @volume; color: @backlight; }

      #custom-arrow7 {
        background: ${if isLaptop then "@backlight" else "@volume"};
        color: @network;
      }
    '';
  };
}
