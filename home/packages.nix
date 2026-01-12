{ pkgs, lib, hostname, ... }:
let
  isWorkPad = hostname == "workpad";
in {
  home.packages = with pkgs; [
    # essentials
    brave
    # chat
    unstable.ferdium
    unstable.signal-desktop
    # misc
    nextcloud-client
    qbittorrent
    bitwarden-desktop
    protonvpn-gui
    protonmail-bridge
    protonmail-bridge-gui
    czkawka-full
    # graphics and multimedia
    inkscape
    krita
    gimp
    kdePackages.kdenlive
    handbrake
    obs-studio
    # audio tools
    audacity
    kid3
    qpwgraph
    flacon
    freac
    # office
    onlyoffice-desktopeditors
    libreoffice
    obsidian
    qalculate-gtk
    # development and sysadmin
    dbeaver-bin
    insomnia
  ] ++ lib.optionals isWorkPad [
    nvtopPackages.full
    zoom-us
  ] ++ lib.optionals (!isWorkPad) [
    prismlauncher
    lutris
  ];
}
