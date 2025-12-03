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
    kdePackages.kdenlive
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
    libreoffice
    protonmail-bridge
  ] ++ lib.optionals isWorkPad [
    ungoogled-chromium
    nvtopPackages.full
    zoom-us
  ] ++ lib.optionals isClaymore [
    prismlauncher
    lutris
  ];
}
