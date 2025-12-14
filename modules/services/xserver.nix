{ ... }: {
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
  };
  services.displayManager.ly.enable = true;
}
