{ ... }: {
  programs.doom-emacs = {
    enable = true;
    doomDir = ./doomDir;
  };
}
