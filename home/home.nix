{ config, pkgs, lib, ... }:
let
  profile = import ./../../user/profile.nix {};
  myapps = lib.flatten (lib.attrValues (import ./../../user/apps.nix {}));
in {
  imports = [
    # Git
    ./config/git
    # Theme (cursor theme, gtk theme, ... )
    ./config/gtk
    ./config/qt
    # Shells
    ./config/bash
    ./config/fish
    # Kitty
    ./config/kitty
    # Mako
    ./config/mako
    # Neovim
    ./config/nvim
    # Kanshi
    ./config/kanshi
    # Fuzzel
    ./config/fuzzel
    # Starship
    ./config/starship
    # Hyprland
    ./config/hyprland
    # Swayosd
    ./config/swayosd
    # Scripts
    ./config/scripts
    # Waybar
    ./config/waybar
    # Xdg
    ./config/xdg
  ];

  # Install applications
  home.packages = with pkgs; myapps;

  home.username = "${profile.user}";
  home.homeDirectory = "/home/${profile.user}";
  home.stateVersion = "${profile.nixos-version}";
  programs.home-manager.enable = true;
}
