{ config, pkgs, ... }:
let
  profile = import ./../../user/profile.nix {};
in {
  imports = [
    # Git
    ./config/git/git.nix
    # Theme (cursor theme, gtk theme, ... )
    ./config/theme/theme.nix
    # Bash
    ./config/bash/bash.nix
    # Fish
    ./config/fish/fish.nix
    # Foot
    ./config/foot/foot.nix
    # Fnott
    ./config/fnott/fnott.nix
    # Neovim
    ./config/nvim/nvim.nix
    # Waybar
    ./config/waybar/waybar.nix
    # Wob
    ./config/wob/wob.nix
    # Kanshi
    ./config/kanshi/kanshi.nix
    # Starship
    ./config/starship/starship.nix
    # Scripts
    ./config/scripts/scripts.nix
  ];

  home.packages = with pkgs; [
    # gnome polkit
    polkit_gnome

    # browser
    firefox

    # cli program
    pulsemixer
    pamixer
    btop
    wl-clipboard
    cliphist
    wf-recorder

    # image viewer
    imv

    # video player
    mpv

    # music players
    cmus

    # video tools
    kdenlive
    handbrake
    obs-studio

    # audio tools
    tenacity
    qpwgraph
    freac
    kid3
    flacon

    # image editors
    gimp
    inkscape
    krita

    # messaging apps
    signal-desktop
    ferdium

    # office suite
    onlyoffice

    # nextcloud client
    nextcloud-client
  ];

  home.username = "${profile.user}";
  home.homeDirectory = "/home/${profile.user}";
  home.stateVersion = "${profile.nixos-version}";
  programs.home-manager.enable = true;
}
