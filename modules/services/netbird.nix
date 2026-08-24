{ pkgs, ... }: {
  services.netbird = {
    enable = true;
    package = pkgs.unstable.netbird;
    ui.enable = false;
  };

  environment.systemPackages = [
    pkgs.unstable.netbird-ui
  ];
}
