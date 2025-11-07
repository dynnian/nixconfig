{ pkgs, ... }: {
  programs.doom-emacs = {
    enable = true;
    doomDir = ./doomdir;
    emacs = pkgs.unstable.emacs-pgtk;
  };
}
