{ ... }: {
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ ];
    allowedUDPPorts = [ ];
    allowPing = true;
    logRefusedConnections = true;
  };
}
