{ ... }: {
  programs.nixvim = {
    opts = {
      number = true;
      clipboard = "unnamedplus";
      expandtab = true;
      tabstop = 4;
      shiftwidth = 4;
      softtabstop = 4;
      smarttab = true;
      shell = "fish";
      shellcmdflag = "-i -c";
      fillchars = { eob = " "; };
      undofile = true;
      undolevels = 10000;
      undoreload = 10000;
    };
  };
}
