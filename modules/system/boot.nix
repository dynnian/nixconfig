{ config, pkgs, ... }: {
  # enable systemd-boot
  boot.loader.systemd-boot.enable = true;

  # enable EFI support
  boot.loader.efi.canTouchEfiVariables = true;

  # disable the editor and set timeout to 0
  boot.loader.systemd-boot.editor = false;
  boot.loader.timeout = 0;

  # use the latest kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # kernel parameters to reduce verbosity
  boot.kernelParams = ["quiet" "rd.systemd.show_status=false" "rd.udev.log_level=3" "udev.log_priority=3"];
  boot.consoleLogLevel = 0;
  boot.initrd.verbose = false;
  boot.initrd.systemd.enable = true;
  systemd.settings.Manager.RebootWatchdogSec = "0";

  # enable plymouth for a graphical boot
  boot.plymouth = {
    enable = true;
    theme = "dragon";
    themePackages = with pkgs; [
        (adi1090x-plymouth-themes.override {
          selected_themes = [ "dragon" ];
        })
      ];
  };
}
