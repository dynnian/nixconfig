{ config, lib, pkgs, ... }: {
  services.throttled.enable = lib.mkDefault true;

  services."06cb-009a-fingerprint-sensor" = {
    enable = true;
    backend = "python-validity";
  };

  security.pam.services = {
    login.fprintAuth = true;
    sudo.fprintAuth = true;
    polkit-1.fprintAuth = true;
    hyprlock.fprintAuth = true;
  };
}
