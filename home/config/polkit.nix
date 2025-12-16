{ pkgs, ... }: {
  services.polkit-gnome = {
    enable = true;
    package = pkgs.polkit_gnome;
  };
}
