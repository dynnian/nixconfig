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
    lockKernelModules = true;
    protectKernelImage = true;
    forcePageTableIsolation =  true;
    pam.services.swaylock = {};
  };
  environment.systemPackages = with pkgs; [
    apparmor-utils
    apparmor-parser
    apparmor-profiles
  ];
}

