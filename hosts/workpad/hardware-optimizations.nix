{ ... }: {
  # Enable NVIDIA graphics
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.open = true;
}
