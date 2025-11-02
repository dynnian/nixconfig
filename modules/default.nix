{ config, lib, pkgs, ...}:
{
  imports = [
    ./programs
    ./virtualization
    ./services
    ./system
  ];

  # enable flakes
  nix.settings.experimental-features = [ "nix-command flakes" ];
}
