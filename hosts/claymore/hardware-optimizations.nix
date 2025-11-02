{ config, lib, pkgs, ... }: {
  # Enable throttled for this computer, common issue in the Thinkpad T480
  services.throttled.enable = lib.mkDefault true;

  # Enable python-validity for the fingerprint sensor in the T480
  services."06cb-009a-fingerprint-sensor" = {
    enable = true;
    backend = "python-validity";
  };
  security.pam.services.login.fprintAuth = true;
}
