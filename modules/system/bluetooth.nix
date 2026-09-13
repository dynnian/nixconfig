{ ... }: {
  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = false;
      settings.General = {
        Experimental = true;
        AutoEnable = false;
        FastConnectable = true;
      };
    };
  };
}
