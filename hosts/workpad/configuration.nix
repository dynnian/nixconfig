{ ... }: {
  imports = [
    ../../modules
    ./hardware-configuration.nix
    ./hardware-optimizations.nix
    ./disko.nix
    ./vpn.nix
    ./evolution.nix
  ];

  networking.hostName = "workpad";
}
