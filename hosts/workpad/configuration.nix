{ config, lib, pkgs, ... }: {
  imports = [
    ../../modules
    ./hardware-configuration.nix
    ./hardware-optimizations.nix
    ./disko.nix
    ./vpn.nix
    ./evolution.nix
  ];

  boot.kernelPackages = pkgs.linuxPackages_lts;
  networking.hostName = "workpad";
}
