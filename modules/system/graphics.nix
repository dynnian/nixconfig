{ pkgs, ... }: with pkgs; {
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = [
        intel-media-driver
        intel-vaapi-driver
        libva-vdpau-driver
        libvdpau-va-gl
        mesa
      ];
    };
  };
}
