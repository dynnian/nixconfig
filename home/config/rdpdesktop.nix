{ config, pkgs, lib, ... }: let
  mimePkgDir = "${config.xdg.dataHome}/mime/packages";
in
{
  xdg.mime.enable = true;
  xdg.mimeApps.enable = true;

  # 1) Teach the MIME DB what .rdp is
  home.file."${mimePkgDir}/rdp.xml".text = ''
    <?xml version="1.0" encoding="UTF-8"?>
    <mime-info xmlns="http://www.freedesktop.org/standards/shared-mime-info">
      <mime-type type="application/x-rdp">
        <comment>Remote Desktop Protocol file</comment>
        <glob pattern="*.rdp"/>
      </mime-type>
    </mime-info>
  '';

  # 2) Update the user MIME database after HM writes the XML
  home.activation.updateMimeDb = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    ${pkgs.shared-mime-info}/bin/update-mime-database "${config.xdg.dataHome}/mime"
  '';

  # 3) Your desktop entry (if not already)
  xdg.desktopEntries.rdpwrap = {
    name = "Open RDP file (rdpwrap)";
    genericName = "Remote Desktop";
    comment = "Open RDP files using rdpwrap (NTLM, no grab)";
    exec = "rdpwrap --dynamic --auth ntlm --no-grab --rdp %f";
    terminal = false;
    mimeType = [ "application/x-rdp" "application/x-remote-desktop" ];
    categories = [ "Network" "RemoteAccess" ];
  };

  # 4) Set defaults for the MIME types
  xdg.mimeApps.defaultApplications = {
    "application/x-rdp" = "rdpwrap.desktop";
    "application/x-remote-desktop" = "rdpwrap.desktop";
  };

  xdg.mimeApps.associations.added = {
    "application/x-rdp" = "rdpwrap.desktop";
    "application/x-remote-desktop" = "rdpwrap.desktop";
  };
}
