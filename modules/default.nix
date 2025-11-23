{ config, lib, pkgs, ... }:
let
  profile = import ./../user/profile.nix {};
in{
  imports = [
    ./programs
    ./virtualization
    ./services
    ./system
  ];

  # enable flakes
  nix.settings.experimental-features = [ "nix-command flakes" ];

  # Configure user
  users.users = {
    ${profile.user} = {
      isNormalUser = true;
      extraGroups = [ 
        "wheel" 
        "networks" 
        "input" 
        "audio"
        "video"
        "lp"
        "dialout"
        "networkmanager"
      ];
      initialHashedPassword = "$y$j9T$A1EPK5/9RvT5w/ihS0AHy0$cdc3gvzstD.DJEFSkgGViSmLEkH4uN/MYATVLoiz7/1";
    };
  };

  # Automatic Nix store maintenance
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
    persistent = true;
  };
  nix.optimise.automatic = true;
  nix.settings = {
    auto-optimise-store = true;
    min-free = 2 * 1024 * 1024 * 1024;
    max-free = 8 * 1024 * 1024 * 1024;
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "${profile.nixos-version}";
}
