{ ... }: {
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
    extraConfig = {
      pipewire."10-custom-formats.conf" = {
        "context.properties" = {
          "default.clock.allowed-rates" = [ 44100 48000 88200 96000 192000 ];
        };
      };
    };
  };
}
