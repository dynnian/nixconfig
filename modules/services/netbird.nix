{ pkgs, ... }: {
  services.netbird = {
    enable = true;
    ui.enable = true;
    ui.package = pkgs.unstable.netbird;
  };
}
