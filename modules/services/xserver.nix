{ pkgs, ... }: {
  environment.sessionVariables = {
    MOZ_USE_XINPUT2 = "1";
    QT_AUT_SCREEN_SCALE_FACTOR = "1";
    XKB_DEFAULT_LAYOUT = "us";
    XDG_SESSION_TYPE = "x11";
    XDG_CURRENT_DESKTOP = "GNOME";
    XDG_SESSION_DESKTOP = "GNOME";
    XDG_MENU_PREFIX = "gnome-";
  };

  services.xserver = {
    enable = true;
    windowManager.awesome = {
      enable = true;
      package = pkgs.awesome;
    };
    displayManager = { 
      sessionCommands = ''
        systemctl --user import-environment DISPLAY XAUTHORITY XDG_CURRENT_DESKTOP DESKTOP_SESSION XDG_SESSION_TYPE
        systemctl --user start graphical-session.target
        '';
      defaultSession = "none+awesome";
    };
  };
  services.displayManager.ly.enable = true;
}
