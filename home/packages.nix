{ pkgs, lib, hostname, ... }:
let
  isWorkPad = hostname == "workpad";
  isZweihander = hostname == "zweihander";
in {
  home.packages = with pkgs; [
    # essentials
    brave
    nemo
    imv
    font-manager
    # tuis
    cmus
    youtube-tui
    ani-cli
    lazyssh
    lazygit
    unstable.resterm
    impala
    bluetui
    clipse
    basalt
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
    unstable.timr-tui
    czkawka-full
    remmina
    unstable.freerdp
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
    beekeeper-studio
  ] ++ lib.optionals isWorkPad [
    nvtopPackages.full
    zoom-us
  ] ++ lib.optionals (!isWorkPad) [
    prismlauncher
    lutris
  ];
}
