{ ... }: {
  services.clamav = {
    daemon.enable = true;
    updater.enable = true;
    daemon.settings = {
      OnAccessExcludePath = "/nix/store";
    };
  };
}
