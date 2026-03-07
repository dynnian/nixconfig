{ ... }: {
  imports = [
    ./flatpak.nix
    ./greetd.nix
    ./gvfs.nix
    ./mullvad.nix
    ./pipewire.nix
    ./power-profiles.nix
    ./printing.nix
    ./timesyncd.nix
    ./keyring.nix
    ./udisks2.nix
  ];
}
