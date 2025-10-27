{ ... }: 
let 
  profile = import ./../../user/profile.nix {};
in {
  virtualisation.podman = {
      enable = true;
      dockerCompat = true;
      dockerSocket.enable = true;

      # Required for containers under podman-compose to be able to talk to each other.
      defaultNetwork.settings.dns_enabled = true;
  };

  # Add user "${profile.user}" to the "podman" group
  users.extraGroups.podman = {
    members = [ "${profile.user}" ];
  };

  # Install distrobox and podman-compose
  environment.systemPackages = with pkgs; [
    distrobox
    podman-compose
  ];
}