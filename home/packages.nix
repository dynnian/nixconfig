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
    lazyssh
    impala
    bluetui
    clipse
    # internet
    unstable.ferdium
    unstable.signal-desktop
    unstable.discord
    nextcloud-client
    qbittorrent
    bitwarden-desktop
    protonvpn-gui
    protonmail-bridge
    protonmail-bridge-gui
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
  ];

  xdg.desktopEntries.discord = {
    name = "Discord";
    genericName = "Internet Messenger";
    comment = "All-in-one voice and text chat for gamers";
    # The fix: wrap the command in sh and redirect output to /dev/null
    exec = "sh -c \"discord %U > /dev/null 2>&1\"";
    icon = "discord";
    type = "Application";
    categories = [ "Network" "InstantMessaging" ];
    mimeType = [ "x-scheme-handler/discord" ];
  };
}
