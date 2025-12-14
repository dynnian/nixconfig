{ ... }: {
  xdg.configFile."awesome" = {
    source = ./configs;
    recursive = true;
  };
}
