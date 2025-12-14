{ pkgs, ... }: {
  services.betterlockscreen = {
    enable = true;
    package = pkgs.betterlockscreen;
  };
}
