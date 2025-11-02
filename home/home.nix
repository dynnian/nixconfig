{ config, pkgs, lib, ... }:
let
  profile = import ./../user/profile.nix {};
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
    nextcloud-client
    bitwarden-desktop
  ];

  home.username = "${profile.user}";
  home.homeDirectory = "/home/${profile.user}";
  home.stateVersion = "${profile.nixos-version}";
  programs.home-manager.enable = true;
}
