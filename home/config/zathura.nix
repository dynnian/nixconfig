{ pkgs, ... }:
let
  theme = import ./../../user/theme.nix {};
in {
  programs.zathura = {
    enable = true;
    package = pkgs.zathura;
    extraConfig = ''
      set font                        "${theme.font-mono} ${toString theme.font-size}"
      set default-bg                  "rgba(29,32,33,0.95)"
      set default-fg                  "#ebdbb2" #01
      set completion-bg               "#4e4e4e" #02
      set completion-fg               "#ebdbb2" #0C
      set completion-highlight-fg     "#4e4e4e" #02
      set completion-highlight-bg     "#87afaf" #0C
      set statusbar-fg                "#ebdbb2" #04
      set statusbar-bg                "rgba(29,32,33,0.95)"
      set notification-bg             "rgba(29,32,33,0.95)"
      set notification-fg             "#458588" #00
      set notification-error-bg       "#262626" #08
      set notification-error-fg       "#cc241d" #00
      set notification-warning-bg     "#262626" #08
      set notification-warning-fg     "#d79921" #00
      set inputbar-bg                 "rgba(29,32,33,0.95)"
      set inputbar-fg                 "#ebdbb2" #02
      set recolor                     "true"
      set recolor-lightcolor          "#262626" #00
      set recolor-darkcolor           "#ebdbb2" #06
      set highlight-color             "#262626" #0A
      set highlight-active-color      "#ebdbb2" #0D
      set recolor-keephue "false"
      set selection-clipboard "clipboard"
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
