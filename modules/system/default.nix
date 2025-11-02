{ ... }: {
  imports = [
    ./bluetooth.nix
    ./boot.nix
    ./environment.nix
    ./firewall.nix
    ./fonts.nix
    ./locale.nix
    ./security.nix
    ./ssd.nix
    ./timezone.nix
    ./graphics.nix
    ./network.nix
  ];
}
