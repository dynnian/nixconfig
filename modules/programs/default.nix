{ lib, hostname, ... }: 
let
  isWorkPad = hostname == "workpad";
  isZweihander = hostname == "zweihander";
in {
  imports = [
    ./dconf.nix
    ./printer.nix
    ./backbone.nix
  ] ++ lib.optionals (!isWorkPad) [
    ./steam.nix
  ] ++ lib.optionals isZweihander [
    ./coolercontrol.nix
  ];
}
