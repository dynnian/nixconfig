{ pkgs, ... }:
let
  lockcmd = "swaylock -f -i \"$(ls -1 \"$HOME/.config/sway/wallpaper/locked.\"{jpg,png} 2>/dev/null | head -n1)\"";
  screenoff = "swaymsg 'output * power off'";
  screenon  = "swaymsg 'output * power on'";
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
      # Lock screen after 5 minutes (300 seconds)
      { timeout = 300; command = lockcmd; }
      # Turn off screen after 10 minutes (600 seconds), turn it back on upon resume
      { timeout = 600; command = screenoff; resumeCommand = screenon; }
    ];
  };
}
