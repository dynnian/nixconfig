{ ... }: {
  imports = [
    ./pipewire.nix
    ./power-profiles.nix
    ./printing.nix
    ./timesyncd.nix
    ./greetd.nix
    ./udisks2.nix
  ];
}
