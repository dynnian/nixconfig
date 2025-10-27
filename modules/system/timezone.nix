{ ... }:
let
  profile = import ./../../user/profile.nix {};
in {
  time.timeZone = "${profile.timezone}";
}
