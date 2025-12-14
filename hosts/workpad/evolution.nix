{ pkgs, ... }: {
  programs.evolution = {
    enable = true;
    plugins = [ pkgs.evolution-ews ];
  };

  services.gnome = {
    evolution-data-server.enable = true;
    gnome-online-accounts.enable = true;
  };

  environment.systemPackages = with pkgs; [
    gnome-calendar
  ];
}
