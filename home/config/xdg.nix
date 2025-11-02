{ pkgs, ... }: {
  xdg = {
    portal = {
      extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
      configPackages = [ pkgs.hyprland ];
    };
  };
}