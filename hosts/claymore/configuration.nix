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

  networking.hostName = "claymore";

  users.users = {
    ${profile.user} = {
      isNormalUser = true;
      extraGroups = [ "wheel" "networks" ];
      initialHashedPassword = "$y$j9T$A1EPK5/9RvT5w/ihS0AHy0$cdc3gvzstD.DJEFSkgGViSmLEkH4uN/MYATVLoiz7/1";
    };
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "${profile.nixos-version}";
}
