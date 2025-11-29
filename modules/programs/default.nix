{ lib, hostname, ... }: 
let
  isClaymore = hostname == "claymore";
in {
  imports = [
    ./dconf.nix
    ./printer.nix
    ./backbone.nix
  ] ++ lib.optionals isClaymore [
   ./steam.nix
  ];
}
