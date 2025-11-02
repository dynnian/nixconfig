{ lib, config, ... }:
let
  isWorkPad = config.networking.hostName == "workpad";
in {
  imports = [
    ./dconf.nix
    ./printer.nix
    ./backbone.nix
  ] ++ lib.optionals isWorkPad [
    ./evolution.nix
  ];
}
