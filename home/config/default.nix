{ lib, hostname , ... }: let 
  isWorkpad = hostname == "workpad";
in{
  imports = [
    ./bash
    ./fish
    ./scripts
    ./sway
    ./nvim
    #./qutebrowser
    ./yazi
    ./btop.nix
    ./direnv.nix
    ./fnott.nix
    ./foot.nix
    ./fuzzel.nix
    ./git.nix
    ./gtk.nix
    ./kanshi.nix
    ./mimeApps.nix
    ./mpv.nix
    ./polkit.nix
    ./qt.nix
    ./starship.nix
    ./virtmanager.nix
    ./waybar.nix
    ./wob.nix
    ./xdg.nix
    ./zathura.nix
  ] ++ lib.optionals isWorkpad [
    ./rdpdesktop.nix
  ];
}
