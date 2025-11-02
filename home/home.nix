{ config, pkgs, lib, ... }:
let
  profile = import ./../user/profile.nix {};
  importedApps = (import ./../user/apps.nix) {};

  # Flatten the entire set of applications into a single list of packages
  resolveApp = appName: pkgs.${appName};

  # Extract values (lists of packages) from the set and flatten them
  myapps = lib.flatten (lib.attrValues importedApps);

  # Map the list of app names (strings) into actual package expressions
  myappsResolved = lib.map (app: resolveApp app) myapps;
in {
  imports = [
    ./config
  ];

  # Install applications
  home.packages = with pkgs; myappsResolved;

  home.username = "${profile.user}";
  home.homeDirectory = "/home/${profile.user}";
  home.stateVersion = "${profile.nixos-version}";
  programs.home-manager.enable = true;
}
