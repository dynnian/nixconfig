{ pkgs, ... }: {
  xdg = {
    enable = true;
    portal = {
      extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
      configPackages = [ pkgs.hyprland ];
    };
  };
}
