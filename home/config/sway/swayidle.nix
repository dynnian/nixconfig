{ pkgs, ... }:
let
  screenoff = "swaymsg 'output * power off'";
  screenon  = "swaymsg 'output * power on'";
  lockcmd = "swaylock -f -i '$HOME/.config/sway/wallpaper/locked.*'";
in {
  services.swayidle = {
    enable = true;
    package = pkgs.swayidle;

    extraArgs = [ "-w" ];

    events = [
      { event = "lock";         command = lockcmd; }
      { event = "before-sleep"; command = lockcmd; }
    ];

    timeouts = [
      { timeout = 300; command = lockcmd; }
      { timeout = 600; command = screenoff; resumeCommand = screenon; }
    ];
  };
}
