{ ... }: {
  imports = [
    ./greetd.nix
    ./gvfs.nix
    ./mullvad.nix
    ./netbird.nix
    ./pipewire.nix
    ./power-profiles.nix
    ./printing.nix
    ./resolved.nix
    ./timesyncd.nix
    ./keyring.nix
    ./udisks2.nix
  ];
}
