{ pkgs, lib, ... }: {
  services.wob = {
    enable = true;
    package = pkgs.wob;
    systemd = true;
    settings = {
      "" = {
        timeout = 500;
        anchor = "center";
        borders_size = 3;
        bar_padding = 10;
        border_color = "cc241dff";
        background_color = "1d2021ff";
        bar_color = "fbf1c7ff";
      };
      "style.muted" = {
        bar_color = "cc241dff";
      };
    };
  };

  # fix wob high cpu usage by not starting the systemd service 
  # on login and instead by the socket on demand
  systemd.user.services.wob.Install.WantedBy = lib.mkForce [ ];
}
