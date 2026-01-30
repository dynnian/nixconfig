{ ... }: {
  imports = [
    ./avahi.nix
    ./pipewire.nix
    ./plasma.nix
    ./printing.nix
    ./timesyncd.nix
    ./flatpak.nix
  ];
}
