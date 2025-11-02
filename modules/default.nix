{ config, lib, pkgs, ... }: {
  imports = [
    ./programs
    ./virtualization
    ./services
    ./system
  ];

  # enable flakes
  nix.settings.experimental-features = [ "nix-command flakes" ];

  # --- Automatic Nix store maintenance ---
  nix.gc = {
    automatic = true;                     # systemd timer/service
    dates = "weekly";                     # e.g. "daily", "Mon,Thu 03:00"
    options = "--delete-older-than 14d";  # keep 14 days of generations
    persistent = true;                    # catch up after sleep/offline
  };

  nix.optimise.automatic = true;          # periodic hardlink dedup

  nix.settings = {
    auto-optimise-store = true;           # optimise on writes
    min-free = 2 * 1024 * 1024 * 1024;    # start GC during builds if disk tight
    max-free = 8 * 1024 * 1024 * 1024;
  };
}
