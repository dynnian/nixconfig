{ config, lib, pkgs, ... }:
let
  palette = config.lib.stylix.colors;
  normalize = v: if lib.hasPrefix "#" v then v else "#${v}";
  hex = {
    rosewater = normalize palette.base06;
    flamingo = normalize palette.base0F;
    pink = normalize palette.base0F;
    mauve = normalize palette.base0E;
    red = normalize palette.base08;
    maroon = normalize palette.base0F;
    peach = normalize palette.base09;
    yellow = normalize palette.base0A;
    green = normalize palette.base0B;
    teal = normalize palette.base0C;
    sky = normalize palette.base0D;
    sapphire = normalize palette.base0D;
    blue = normalize palette.base0D;
    lavender = normalize palette.base07;
    text = normalize palette.base05;
    subtext1 = normalize palette.base07;
    subtext0 = normalize palette.base06;
    overlay2 = normalize palette.base04;
    overlay1 = normalize palette.base03;
    overlay0 = normalize palette.base02;
    surface2 = normalize palette.base04;
    surface1 = normalize palette.base03;
    surface0 = normalize palette.base02;
    base = normalize palette.base00;
    mantle = normalize palette.base01;
    crust = normalize palette.base00;
  };
  hexA = name: alpha:
    let
      base = lib.removePrefix "#" hex.${name};
      n = builtins.floor (alpha * 255);
      digits = "0123456789abcdef";
      hi = builtins.substring (builtins.floor (n / 16)) 1 digits;
      lo = builtins.substring (n - (builtins.floor (n / 16) * 16)) 1 digits;
    in "#${base}${hi}${lo}";
in {
  programs.zathura = {
    enable = true;
    package = pkgs.zathura;
    extraConfig = ''
      set font                        \"${config.stylix.fonts.sansSerif.name} ${toString config.stylix.fonts.sizes.applications}\"
      set default-fg                  ${hex.text}
      set default-bg                  ${hex.base}
      set completion-bg               ${hex.surface0}
      set completion-fg               ${hex.text}
      set completion-highlight-bg     ${hex.surface1}
      set completion-highlight-fg     ${hex.text}
      set completion-group-bg         ${hex.surface0}
      set completion-group-fg         ${hex.blue}
      set statusbar-fg                ${hex.text}
      set statusbar-bg                ${hex.surface0}
      set notification-bg             ${hex.surface0}
      set notification-fg             ${hex.text}
      set notification-error-bg       ${hex.surface0}
      set notification-error-fg       ${hex.red}
      set notification-warning-bg     ${hex.surface0}
      set notification-warning-fg     ${hex.yellow}
      set inputbar-fg                 ${hex.text}
      set inputbar-bg                 ${hex.surface0}
      set recolor                     \"true\"
      set recolor-lightcolor          ${hex.base}
      set recolor-darkcolor           ${hex.text}
      set index-fg                    ${hex.text}
      set index-bg                    ${hex.base}
      set index-active-fg             ${hex.text}
      set index-active-bg             ${hex.surface0}
      set render-loading-bg           ${hex.base}
      set render-loading-fg           ${hex.text}
      set highlight-color             ${hexA "overlay2" 0.5}
      set highlight-fg                ${hexA "mauve" 0.5}
      set highlight-active-color      ${hexA "mauve" 0.5}
      set recolor-keephue \"false\"
      set selection-clipboard \"clipboard\"
      map [fullscreen] a adjust_window best-fit
      map [fullscreen] s adjust_window width
      map [fullscreen] f follow
      map [fullscreen] <Tab> toggle_index
      map [fullscreen] j scroll down
      map [fullscreen] k scroll up
      map [fullscreen] h navigate previous
      map [fullscreen] l navigate next
    '';
  };
}