{ pkgs, ... }: {
  services.gnome.gnome-keyring.enable = true;
  security.pam.services = {
    login.enableGnomeKeyring = true;
  };
  services.dbus.packages = [ pkgs.gcr ];
}
