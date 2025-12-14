{ pkgs, ... }: {
  xsession.windowManager.awesome = {
    enable = true;
    package = pkgs.awesome;
  };

  xdg.configFile."awesome" = {
    source = ./configs;
    recursive = true;
  };
}
