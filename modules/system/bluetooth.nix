{ ... }: {
  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings.General = {
        Experimental = true;
        AutoEnable = false;
        FastConnectable = true;
      };
    };
  };
}
