{ config, lib, pkgs, ...}:
{
  imports = [
    ./programs
    ./virtualization
    ./services
    ./system
  ];

  # allow installing non-free packages
  nixpkgs.config.allowUnfree = true;

  # enable flakes
  nix.settings.experimental-features = [ "nix-command flakes" ];
}
