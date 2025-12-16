{ config, pkgs, lib, ... }:
let
  profile = import ./../../user/profile.nix {};
in {
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        user = profile.user;

        command = lib.concatStringsSep " " [
          "${pkgs.tuigreet}/bin/tuigreet"
          "--time"
          "--remember"
          "--remember-user-session"
          "--sessions ${config.services.displayManager.sessionData.desktops}/share/wayland-sessions"
          "--xsessions ${config.services.displayManager.sessionData.desktops}/share/xsessions"
          "--cmd sway"
        ];
      };
    };
  };
}
