
{ pkgs, ...}:
let
  profile = import ./../../user/profile.nix {};
in {
  services.greetd = {
    enable = true;
    vt = 1;
    settings = {
      default_session = {
        user = profile.user;
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland"; # start Hyprland with a TUI login manager
      };
    };
  };
}
