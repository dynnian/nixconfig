{ config, pkgs, lib, hostname, ... }:
let
  profile = import ./../user/profile.nix {};
  isWorkPad = hostname == "workpad";
  isClaymore = hostname == "claymore";
in {
  imports = [
    ./config
  ];

  # Install applications
  home.packages = with pkgs; [
    neovide
    firefox
    imv
    cmus
    ferdium
    signal-desktop
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
  ] ++ lib.optionals isWorkPad [
    ungoogled-chromium
    unstable.remmina
  ] ++ lib.optionals isClaymore [
    prismlauncher
    lutris
  ];

  home.username = "${profile.user}";
  home.homeDirectory = "/home/${profile.user}";
  home.stateVersion = "${profile.nixos-version}";
  programs.home-manager.enable = true;
}
