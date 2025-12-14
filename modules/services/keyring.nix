{ pkgs, ... }: {
  services.gnome.gnome-keyring.enable = true;
  security.pam.services = {
    ly.enableGnomeKeyring = true;
    login.enableGnomeKeyring = true;
  };
  services.dbus.packages = [ pkgs.gcr ];
}
