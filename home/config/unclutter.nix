{ pkgs, ... }: {
  services.unclutter = {
    enable = true;
    package = pkgs.unclutter-xfixes;
  };
}
