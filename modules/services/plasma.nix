{ ... }: {
  services.displayManager.sddm.enable = true;
  services.displayManager.sddk.wayland.enable = true;
  services.displayManager.sddm.settings.General.DisplayServer = "wayland";
  services.desktopManager.plasma6.enable = true;
}
