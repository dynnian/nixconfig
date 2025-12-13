{ pkgs, ... }: {
  programs.btop = {
    enable = true;
    package = pkgs.btop;

    # Stylix provides the theme; keep only behavioral toggles here.
    settings = {
      truecolor = true;
      vim_keys = true;
      graph_symbol = "braille";
    };
  };
}
