{ pkgs, lib, hostname, ... }:
let
  isWorkPad = hostname == "workpad";
  isZweihander = hostname == "zweihander";
in {
  home.packages = with pkgs; [
    brave
    nemo
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
    font-manager
    (unstable.timr-tui.override { enableSound = true; })
    tor-browser
  ] ++ lib.optionals isWorkPad [
    nvtopPackages.full
    zoom-us
  ] ++ lib.optionals (!isWorkPad) [
    prismlauncher
    lutris
  ] ++ lib.optionals isZweihander [
    monero-gui
    p2pool
  ];
}
