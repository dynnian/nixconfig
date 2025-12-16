{ pkgs, ... }:
let
  lockcmd = ''
    swaylock -f -i "$(ls -1 "$HOME/.config/sway/wallpaper/locked."* 2>/dev/null | head -n1)"
  '';
  screenoff = "swaymsg 'output * power off'";
  screenon  = "swaymsg 'output * power on'";
in {
  services.swayidle = {
    enable = true;
    package = pkgs.swayidle;

    extraArgs = [ "-w" ];

    events = [
      { event = "lock";        command = lockcmd; }
      { event = "before-sleep"; command = lockcmd; }
    ];

    timeouts = [
      { timeout = 300; command = lockcmd; }
      { timeout = 600; command = screenoff; resumeCommand = screenon; }
    ];
  };
}
