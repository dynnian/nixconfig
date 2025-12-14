{ pkgs, ... }:
let
  dimAll = pkgs.writeShellScript "xidlehook-dim-all" ''
    set -eu
    xrandr --listmonitors \
      | awk '/^\s*[0-9]+:/ {print $4}' \
      | while read -r output; do
          xrandr --output "$output" --brightness 0.5
        done
  '';

  restoreAll = pkgs.writeShellScript "xidlehook-restore-all" ''
    set -eu
    xrandr --listmonitors \
      | awk '/^\s*[0-9]+:/ {print $4}' \
      | while read -r output; do
          xrandr --output "$output" --brightness 1
        done
  '';

  lockCmd = "betterlockscreen -l";
in
{
  services.xidlehook = {
    enable = true;

    not-when-fullscreen = true;
    not-when-audio = true;

    timers = [
      {
        delay = 60;
        command = "${dimAll}";
        canceller = "${restoreAll}";
      }
      {
        delay = 30;
        command = lockCmd;
        canceller = "${restoreAll}";
      }
    ];
  };
}
