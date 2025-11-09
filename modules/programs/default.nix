{ lib, hostname, ... }: {
  imports = [
    ./dconf.nix
    ./printer.nix
    ./backbone.nix
  ];
}
