{ pkgs, lib, hostname, inputs, ... }:
let
  isWorkPad = hostname == "workpad";
in {
  home.packages = with pkgs; [
    # essentials
    firefox
    nemo
    imv
    # tuis
    cmus
    youtube-tui
    ani-cli
    inputs.subtui.packages.${pkgs.system}.default
    # internet
    ferdium
    signal-desktop
    nextcloud-client
    qbittorrent
    bitwarden-desktop
    tor-browser
    # misc
    czkawka-full
    freerdp
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
