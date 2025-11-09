{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    unstable.snx-rs
    stoken
  ];

  systemd.services.snx-rs = {
    enable = true;
    path = [pkgs.iproute2 pkgs.kmod pkgs.networkmanager];
    description = "SNX-RS VPN client for Linux";
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
        ExecStart = "${pkgs.unstable.snx-rs}/bin/snx-rs -m command -l debug";
        Type = "simple";
    };
  };

  # update the firewall rule to allow keepalive traffic
  networking.firewall.checkReversePath = "loose";
}
