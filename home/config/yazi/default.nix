{ pkgs, ... }:
let
  settings = import ./yazi.nix;
  keymap = import ./keymap.nix;
  theme = builtins.fromTOML (builtins.readFile ./theme.toml);
in
{
  programs.yazi = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    shellWrapperName = "yy";
    settings = settings;
    keymap = keymap;
    theme = theme;
  };
}
