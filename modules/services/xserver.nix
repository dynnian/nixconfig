{ pkgs, ... }: {
  services.xserver = {
    enable = true;

    windowManager.awesome = {
      enable = true;
      package = pkgs.awesome;
    };
  };

  services.displayManager.sddm = {
    enable = true;
    theme = "catppuccin-mocha-lavender";
    sessionCommands = ''
      eval $(gnome-keyring-daemon --start --daemonize --components=ssh,secrets)
      export SSH_AUTH_SOCK '';
  };

  environment.systemPackages = [
    (pkgs.catppuccin-sddm.override {
      flavor = "mocha";
      accent = "lavender";
      loginBackground = false;
    })
  ];
}
