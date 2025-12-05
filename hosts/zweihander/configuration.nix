{ config, lib, pkgs, ... }: {
  imports = [
    ../../modules
    ./hardware-configuration.nix
    ./disko.nix
  ];

  networking.hostName = "zweihander";
}
