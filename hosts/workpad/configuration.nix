{ config, lib, pkgs, ... }: {
  imports = [
    ../../modules
    ./hardware-configuration.nix
    ./hardware-optimizations.nix
    ./disko.nix
    ./vpn.nix
    ./evolution.nix
  ];

  boot.kernelPackages = pkgs.linuxPackages_6_12;
  networking.hostName = "workpad";
}
