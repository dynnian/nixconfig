{ pkgs, lib, hostname, ... }:
let
  isWorkPad = hostname == "workpad";
in {
  home.packages = with pkgs; [
    brave
    xfce.thunar
    imv
    cmus
    unstable.ferdium
    unstable.signal-desktop
    nextcloud-client
    bitwarden-desktop
    inkscape
    krita
    gimp
    kdePackages.kdenlive
    kid3
    qpwgraph
    flacon
    freac
    handbrake
    audacity
    aonsoku
    onlyoffice-desktopeditors
    qbittorrent
    protonvpn-gui
    obsidian
    obs-studio
    protonmail-bridge
    dbeaver-bin
    insomnia
    qalculate-gtk
    libreoffice
    protonmail-bridge
    protonmail-bridge-gui
    lazyssh
    tor-browser
  ] ++ lib.optionals isWorkPad [
    nvtopPackages.full
    zoom-us
  ] ++ lib.optionals (!isWorkPad) [
    prismlauncher
    lutris
  ];
}
