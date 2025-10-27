{ config, pkgs, ... }:
{
  programs.fish.enable = true;
  xdg.configFile."fish/config.fish".source = ./config.fish;
  xdg.configFile."fish/functions".source = ./functions;
  xdg.configFile."fish/conf.d".source = ./conf.d;
}
