{ pkgs, ... }: {
  environment.sessionVariables = {
    MOZ_USE_XINPUT2 = "1";
    QT_AUT_SCREEN_SCALE_FACTOR = "1";
    XKB_DEFAULT_LAYOUT = "us";
    XDG_SESSION_TYPE = "x11";
    XDG_CURRENT_DESKTOP = "GNOME";
    XDG_SESSION_DESKTOP = "GNOME";
    XDG_MENU_PREFIX = "gnome-";
    WINDOW_MANAGER = "dwm";
  };

  services.xserver = {
    enable = true;

    windowManager.awesome = {
      enable = true;
      package = pkgs.awesome;
    };

    displayManager.sessionCommands = ''
      eval $(gnome-keyring-daemon --start --daemonize --components=ssh,secrets)
      export SSH_AUTH_SOCK
    '';
  };

  services.displayManager.sddm = {
    enable = true;
    theme = "catppuccin-mocha-lavender";
  };

  environment.systemPackages = [
    (pkgs.catppuccin-sddm.override {
      flavor = "mocha";
      accent = "lavender";
      loginBackground = false;
    })
  ];
}
