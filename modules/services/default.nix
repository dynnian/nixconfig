{ ... }: {
  imports = [
    ./clamav.nix
    ./pipewire.nix
    ./power-profiles.nix
    ./printing.nix
    ./timesyncd.nix
    ./keyring.nix
    ./greetd.nix
    ./udisks2.nix
    ./flatpak.nix
    ./gvfs.nix
  ];
}
