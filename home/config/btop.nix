{ pkgs, ... }: {
  programs.btop = {
    enable = true;
    package = pkgs.btop;

    settings = {
      color_theme = "gruvbox_dark_v2";
      truecolor   = true;
      vim_keys    = true;
      graph_symbol = "braille";
    };
  };
}
