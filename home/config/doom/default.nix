{ ... }: {
  programs.doom-emacs = {
    enable = true;
    doomDir = ./doomdir;
    tangleArgs = ".";
  };
}
