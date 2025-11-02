{ config, pkgs, lib, ... }:
let
  profile = import ./../user/profile.nix {};
  importedApps = (import ./../user/apps.nix) {};

  # Flatten the entire set of applications into a single list of packages
  resolveApp = appName: pkgs.${appName};

  # Extract values (lists of packages) from the set and flatten them
  myapps = lib.flatten (lib.attrValues importedApps);

  # Map the list of app names (strings) into actual package expressions
  myappsResolved = lib.map (app: resolveApp app) myapps;
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
    # Waybar
    ./config/yazi
    # Xdg
    ./config/xdg
  ];

  # Install applications
  home.packages = with pkgs; myappsResolved;

  home.username = "${profile.user}";
  home.homeDirectory = "/home/${profile.user}";
  home.stateVersion = "${profile.nixos-version}";
  programs.home-manager.enable = true;
}
