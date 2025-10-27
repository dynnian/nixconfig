# This is your system's configuration file.
{ config, lib, pkgs, ... }:
let
  profile = import ./../../user/profile.nix {};
in {
  imports = [
    ../../modules
    ./hardware-configuration.nix
    ./hardware-optimizations.nix
    ./disko.nix
  ];

  networking.hostName = "workpad";

  users.users = {
    ${profile.user} = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
    };
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "${profile.nixos-version}";
}
