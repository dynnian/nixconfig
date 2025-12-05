{ lib, hostname, ... }: 
let
  isWorkPad = hostname == "workpad";
in {
  imports = [
    ./dconf.nix
    ./printer.nix
    ./backbone.nix
  ] ++ lib.optionals (!isWorkPad) [
   ./steam.nix
  ];
}
