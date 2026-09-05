{ pkgs, inputs, ... }: {
  home.packages = with pkgs; [
    # essentials
    firefox
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
    # misc
    czkawka-full
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
    libreoffice
    obsidian
    qalculate-gtk
    # gaming
    prismlauncher
    lutris
  ];
}
