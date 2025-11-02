{ pkgs, ... }: {
  services.flatpak.enable = true;
  xdg = {
    enable = true;
    mime.enable = true;
    mimeApps = {
      enable = true;
    };
    portal = {
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
      config.default = "gtk";
    };
  };
}