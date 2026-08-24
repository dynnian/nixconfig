{ pkgs, ... }: {
  services.netbird = {
    enable = true;
    package = pkgs.unstable.netbird;
    ui.enable = true;
    ui.package = pkgs.unstable.netbird-ui;
  };
}
