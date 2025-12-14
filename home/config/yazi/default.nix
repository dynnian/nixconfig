{ ... }:
let
  settings = builtins.fromTOML (builtins.readFile ./yazi.toml);
  keymap = builtins.fromTOML (builtins.readFile ./keymap.toml);
  theme = builtins.fromTOML (builtins.readFile ./theme.toml);
in {
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
