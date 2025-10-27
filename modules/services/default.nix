{ ... }: {
  imports = [
    ./pipewire.nix
    ./power-profiles.nix
    ./printing.nix
    ./timesyncd.nix
  ];
}