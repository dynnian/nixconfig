{ ... }: {
  services.screen-locker = {
    enable = true;
    lockCmd = "betterlockscreen -l";
    xss-lock = {
      screensaverCycle = 0;
    };
    xautolock.enable = false;
  };
}
