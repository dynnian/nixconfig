{ pkgs, lib, ... }: {
  # Enable needed GNOME services for Evolution and Calendar
  services.gnome = {
    evolution-data-server.enable = true;
    gnome-online-accounts.enable = true;
    gnome-keyring.enable = true;
  };

  # Enable Evolution mail client with EWS support
  programs.evolution = {
    enable = true;
    plugins = [ pkgs.evolution-ews ];
  };

  # GNOME Calendar for integration
  environment.systemPackages = with pkgs; [
    gnome-calendar
  ];
}
