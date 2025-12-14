{ pkgs, ... }: {
  xsession.windowManager.awesome = {
    enable = true;
    package = pkgs.awesome;
  };

  # Install your awesomewm config directory into ~/.config/awesome
  xdg.configFile."awesome" = {
    source = ./configs;
    recursive = true;
  };
}
