{ ... }: {
  imports = [
    ../../modules
    ./hardware-configuration.nix
    ./hardware-optimizations.nix
    ./disko.nix
  ];

  networking.hostName = "claymore";
}
