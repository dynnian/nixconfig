{ ... }: {
  security = {
    rtkit = {
      enable = true;
    };
    sudo = {
      enable = true;
      wheelNeedsPassword = true;
    };
    polkit = {
      enable = true;
    };
    pam.services.swaylock = {};
  };
}
