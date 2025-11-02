{ pkgs, ... }: with pkgs; {
  hardware = {
    graphics = {
      enable = true;
      extraPackages = [
        intel-media-driver
        intel-vaapi-driver
        libvdpau-va-gl
        vaapiIntel
        vaapiVdpau
        mesa
      ];
    };
  };
}
