{ config, pkgs, lib, hostname, ... }:
let
  profile = import ./../user/profile.nix {};
in {
  imports = [
    ./packages.nix
    ./config
  ];

  home.username = "${profile.user}";
  home.homeDirectory = "/home/${profile.user}";
  home.stateVersion = "${profile.nixos-version}";
  programs.home-manager.enable = true;
}
