{ lib, hostname, ... }: 
let
  isClaymore = hostname == "claymore";
in{
  imports = [
    ./dconf.nix
    ./printer.nix
    ./backbone.nix
    ./steam.nix
  ];
  #] ++ lib.optionals isClaymore [
  #  ./steam.nix
  #];
}
