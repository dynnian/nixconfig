{ ... }:
{
  security = {
    rtkit = {
      enable = true;
    };
    pam = {
      services = {
        swaylock = {};
      };
    };
    sudo = {
      enable = true;
      wheelNeedsPassword = true;
    };
    polkit = {
      enable = true;
    };
  };
}