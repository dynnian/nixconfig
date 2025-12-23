{ ... }: {
  programs.nixvim.extraConfigVim = ''
    filetype plugin indent on
  '';
}
