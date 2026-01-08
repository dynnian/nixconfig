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
    unstable.sqlit-tui
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
    (pkgs.freerdp.overrideAttrs (old: {
      cmakeFlags = (old.cmakeFlags or []) ++ [
        "-DWITH_CLIENT_SDL3=ON"
      ];
      buildInputs = (old.buildInputs or []) ++ [ pkgs.sdl3 ];
    }))
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
  ] ++ lib.optionals isZweihander [
    monero-gui
    p2pool
  ];
}
