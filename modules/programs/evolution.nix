{ pkgs, lib, ... }: {
  # Install evolution
  programs.evolution = {
    enable = true;
    plugins = [ pkgs.evolution-ews ];
  };
  # Enable needed GNOME services for Evolution and Calendar
  services.gnome = {
    evolution-data-server.enable = true;
    gnome-online-accounts.enable = true;
  };

  # GNOME Calendar for integration
  environment.systemPackages = with pkgs; [
    gnome-calendar
  ];
}
