{ ... }: {
  imports = [
    ./clamav.nix
    ./pipewire.nix
    ./plasma.nix
    ./power-profiles.nix
    ./printing.nix
    ./timesyncd.nix
    ./keyring.nix
    ./udisks2.nix
    ./flatpak.nix
    ./gvfs.nix
  ];
}
