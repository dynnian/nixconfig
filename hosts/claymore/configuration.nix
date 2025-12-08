{ config, lib, pkgs, ... }: {
  imports = [
    ../../modules
    ./hardware-configuration.nix
    ./hardware-optimizations.nix
    ./disko.nix
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;
  networking.hostName = "claymore";
}
