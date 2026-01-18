{ pkgs, lib, hostname, ... }:
let
  isWorkPad = hostname == "workpad";
in {
  home.packages = with pkgs; [
    # essentials
    nemo
    imv
    font-manager
    # tuis
    cmus
    youtube-tui
    ani-cli
    lazyssh
    impala
    bluetui
    clipse
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
    unstable.freerdp
    dbeaver-bin
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
  ] ++ lib.optionals isWorkPad [
    brave
    nvtopPackages.full
    zoom-us
  ] ++ lib.optionals (!isWorkPad) [
    prismlauncher
    lutris
  ];
}
