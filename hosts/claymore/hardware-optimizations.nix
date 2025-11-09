{ config, lib, pkgs, ... }:
let
  pamWithFprint = [
    "login"
    "sudo"
    "polkit-1"
    "hyprlock"
  ];
in {
  services.throttled.enable = lib.mkDefault true;

  services."06cb-009a-fingerprint-sensor" = {
    enable = true;
    backend = "python-validity";
  };

  services.fprintd.enable = true;

  security.pam.services =
    builtins.listToAttrs (map (name: {
      name = name;
      value = { fprintAuth = true; };
    }) pamWithFprint);

  security.pam.fprintd = {
    enable = true;
    retryAuthAfter = 1;
    timeout = 5;
  };
}
