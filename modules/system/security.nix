{ pkgs, ... }: {
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
    apparmor = {
      enable = true;
      killUnconfinedConfinables = true;
    };
    pam.services.swaylock = {};
  };

  environment.systemPackages = with pkgs; [
    apparmor-utils
    apparmor-parser
  ];
}
