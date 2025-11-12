{ ... }: {
  # enable real-time scheduling for PipeWire
  security.rtkit.enable = true;

  # enable PipeWire and its components
  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };
}
