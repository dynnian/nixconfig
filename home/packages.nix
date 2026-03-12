{ pkgs, lib, hostname, ... }:
let
  isWorkPad = hostname == "workpad";
in {
  home.packages = with pkgs; [
    # essentials
    brave
    nemo
    imv
    # tuis
    cmus
    youtube-tui
    ani-cli
    inputs.subtui.packages.${pkgs.system}.default
    # internet
    unstable.ferdium
    unstable.signal-desktop
    nextcloud-client
    qbittorrent
    bitwarden-desktop
    aonsoku
    # misc
    czkawka-full
    unstable.freerdp
    font-manager
    # development
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
    nvtopPackages.full
    zoom-us
  ] ++ lib.optionals (!isWorkPad) [
    prismlauncher
    lutris
    retroarch
    cemu
    xemu
    pcsx2
  ];
}
