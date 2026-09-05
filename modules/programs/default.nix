{ lib, hostname, ... }: 
let
  isZweihander = hostname == "zweihander";
in {
  imports = [
    ./printer.nix
    ./backbone.nix
    ./steam.nix
  ] ++ lib.optionals isZweihander [
    ./coolercontrol.nix
  ];
}
