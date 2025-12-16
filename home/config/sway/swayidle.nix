{ pkgs, ... }:
let
  screenoff = "swaymsg 'output * power off'";
  screenon  = "swaymsg 'output * power on'";
  
  lockScript = pkgs.writeShellScript "idlelock" ''
    wallpaper="$HOME/.config/sway/wallpaper/locked."
    ls_command=$(command -v ls)
    image=$($ls_command -1 $wallpaper{jpg,png} 2>/dev/null | head -n1)
    if [ -n "$image" ]; then
      exec swaylock -f -i "$image"
    else
      exec swaylock -f
    fi
  '';

  lockcmd = "${lockScript}";
  
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
