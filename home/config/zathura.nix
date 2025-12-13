{ config, pkgs, ... }:
{
  programs.zathura = {
    enable = true;
    package = pkgs.zathura;
    extraConfig = ''
      set font                        \"${config.stylix.fonts.sansSerif.name} ${toString config.stylix.fonts.sizes.applications}\"
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
