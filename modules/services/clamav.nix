{ ... }: {
  services.clamav = {
    enable = true;
    updater.enable = true;
    daemon.settings = {
      OnAccessExcludePath = "/nix/store";
    };
  };
}
