{ lib, hostname , ... }: let 
  isWorkpad = hostname == "workpad";
in{
  imports = [
    ./bash
    #./development
    ./fish
    ./scripts
    ./sway
    ./nvim
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
    ./newsboat.nix
    ./polkit.nix
    ./qt.nix
    ./qutebrowser.nix
    ./starship.nix
    ./subtui.nix
    ./virtmanager.nix
    ./waybar.nix
    ./wob.nix
    ./xdg.nix
    ./zathura.nix
  ] ++ lib.optionals isWorkpad [
    ./rdpdesktop.nix
  ];
}
