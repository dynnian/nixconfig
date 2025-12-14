{ config, pkgs, ... }: let
  themeFile = "rofi/catppuccin-mocha.rasi";
in {
  xdg.enable = true;

  programs.rofi = {
    enable = true;
    package = pkgs.rofi;

    terminal = "kitty";
    font = "mononoki Nerd Font 12";
    location = "center";

    theme = "${config.xdg.configHome}/${themeFile}";

    extraConfig = {
      modi = "run,drun,window,filebrowser";
      lines = 10;

      show-icons = true;
      icon-theme = "Papirus-Dark";

      drun-display-format = "{icon} {name}";

      disable-history = false;
      hide-scrollbar = true;

      display-drun = "   Apps ";
      display-run = "   Run ";
      display-window = " 󰕰  Window ";
      display-Network = " 󰤨  Network ";
      display-filebrowser = "   Browser ";

      sidebar-mode = true;

      dpi = 100;
    };
  };

  xdg.configFile.${themeFile}.text = ''
    * {
      bg-col:       #1e1e2e;
      bg-col-light: #313244;
      border-col:   #45475a;
      selected-col: #313244;
      blue:         #89b4fa;
      fg-col:       #cdd6f4;
      fg-col2:      #cdd6f4;
      grey:         #7f849c;
      width:        600;
      selected:     #cdd6f4;
      red:          #f38ba8;
      green:        #a6e3a1;
      empty:        #313244;
      inactive:     #7f849c;
    }

    element-text, element-icon , mode-switcher {
      background-color: inherit;
      text-color:       inherit;
    }

    window {
      height: 400;
      width: 700;
      border: 3px;
      border-color: @border-col;
      background-color: @bg-col;
    }

    mainbox {
      background-color: @bg-col;
    }

    inputbar {
      children: [prompt,entry];
      background-color: @bg-col;
      border-radius: 5px;
      padding: 2px;
    }

    prompt {
      background-color: @red;
      padding: 3px;
      text-color: @bg-col;
      border-radius: 3px;
      margin: 20px 0px 0px 20px;
    }

    textbox-prompt-colon {
      expand: false;
      str: ":";
    }

    entry {
      padding: 6px;
      margin: 20px 0px 0px 10px;
      text-color: @fg-col;
      background-color: @bg-col;
    }

    listview {
      border: 0px 0px 0px;
      padding: 2px 2px 2px;
      margin: 10px 20px 0px 20px;
      columns: 2;
      background-color: @bg-col;
    }

    element {
      padding: 5px;
      background-color: @bg-col;
      text-color: @grey;
    }

    element-icon {
      size: 28px;
    }

    element selected {
      background-color:  @selected-col;
      text-color: @fg-col2;
    }

    mode-switcher {
      spacing: 0;
    }

    button {
      padding: 10px;
      background-color: @bg-col;
      text-color: @inactive;
      vertical-align: 0.5;
      horizontal-align: 0.5;
    }

    button selected {
      background-color: @selected-col;
      text-color: @red;
    }
  '';
}
