{ ... }: {
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ ];
    allowedUDPPorts = [ ];
    allowPing = true;
    logRefusedConnections = true;
    
    # 1. Allow NetBird's WireGuard interface
    trustedInterfaces = [ "virbr0" "wt0" ];

    # 2. Prevent the kernel from dropping WireGuard packets
    checkReversePath = "loose";
  };
}
