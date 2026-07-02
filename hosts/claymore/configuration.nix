{ ... }: {
  imports = [
    ../../modules
    ./hardware-configuration.nix
    ./hardware-optimizations.nix
    ./disko.nix
    ../workpad/vpn.nix
  ];

  networking.hostName = "claymore";
}
