{ lib, hostname, ... }: 
let 
  isWorkPad = hostname == "workpad";
in {
  imports = [
    ./btop.nix
    ./fish.nix
    ./fuzzel.nix
    ./zathura.nix
    ./git.nix
    ./kanshi.nix
    ./kitty.nix
    ./mako.nix
    ./nvim.nix
    ./newsboat.nix
    ./starship.nix
    ./swayosd.nix
    ./qt.nix
    ./gtk.nix
    ./virtmanager.nix
    ./waybar.nix
    ./xdg.nix
    ./mimeApps.nix
    ./mpv.nix
    ./youtube-tui.nix
    ./bash
    ./hyprland
    ./scripts
    ./yazi
  ] ++ lib.optionals isWorkPad [
    ./evolution.nix
  ];
}
