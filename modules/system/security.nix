{ pkgs, ... }: {
  security = {
    rtkit = {
      enable = true;
    };
    sudo-rs = {
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
    protectKernelImage = true; 
    forcePageTableIsolation = true; 
    pam.services.swaylock = {};
  };
  environment.systemPackages = with pkgs; [
    apparmor-utils
    apparmor-parser
    apparmor-profiles
  ];
}

