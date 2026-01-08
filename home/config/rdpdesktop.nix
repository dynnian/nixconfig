{ ... }: {
  xdg.desktopEntries.rdpwrap = {
    name = "Open RDP file (rdpwrap)";
    genericName = "Remote Desktop";
    comment = "Open RDP files using rdpwrap (NTLM, no grab)";
    exec = "rdpwrap --dynamic --no-grab --auth ntlm --rdp %f";
    terminal = false;

    mimeType = [
      "application/x-rdp"
    ];

    categories = [ "Network" "RemoteAccess" ];
  };
}
