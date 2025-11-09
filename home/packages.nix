{ pkgs, lib, hostname, ... }:
let
  isWorkPad = hostname == "workpad";
  isClaymore = hostname == "claymore";
in {
  home.packages = with pkgs; [
    firefox
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
    libsForQt5.kdenlive
    qpwgraph
    flacon
    freac
    handbrake
    audacity
    supersonic
    onlyoffice-desktopeditors
    qbittorrent
    protonvpn-gui
    obsidian
    obs-studio
    protonmail-bridge
    dbeaver-bin
    insomnia
    qalculate-gtk
  ] ++ lib.optionals isWorkPad [
    ungoogled-chromium
    unstable.remmina
    zoom-us
  ] ++ lib.optionals isClaymore [
    prismlauncher
    lutris
  ];
}
