{ pkgs, unstablePkgs, ... }: {
  environment.systemPackages = with pkgs; [
    unstablePkgs.snx-rs
  ];

  systemd.services.snx-rs = {
    enable = true;
    path = [pkgs.iproute2 pkgs.kmod pkgs.networkmanager]; # for ip, modprobe and nmcli commands
    description = "SNX-RS VPN client for Linux";
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
        ExecStart = "${unstablePkgs.snx-rs}/bin/snx-rs -m command -l debug";
        Type = "simple";
    };
  };

  # update the firewall rule to allow keepalive traffic
  networking.firewall.checkReversePath = "loose";
}