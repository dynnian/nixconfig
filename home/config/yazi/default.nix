{ pkgs, ... }:
let
  settings = builtins.fromTOML (builtins.readFile ./yazi.toml);
  keymap = builtins.fromTOML (builtins.readFile ./keymap.toml);
in
{
  programs.yazi = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    shellWrapperName = "yy";
    settings = settings;
    keymap = keymap;
  };
}
