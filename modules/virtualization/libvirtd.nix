{ ... }: 
let
  profile = import ./../../user/profile.nix {};
in
{
  # enable virtualization with virt-manager and libvirt
  programs.virtmanager.enable = true;
  virtualisation = {
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
  };

  # Add user "${profile.user}" to the "libvirtd" group
  users.extraGroups.libvirtd = {
    members = [ "${profile.user}" ];
  };
}