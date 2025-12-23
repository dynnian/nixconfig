{ ... }: 
let 
  theme = import ./../../user/theme.nix {};
in {
  programs.neovide = {
    enable = true;
    settings = {
      frame = "full";
      idle = true;
      maximized = false;
      mouse-cursor-icon = "block";
      no-multigrid = false;
      tabs = true;
      title-hidden = true;
      vsync = true;
      font = {
        normal = [ "${theme.font-mono}" ];
        size = theme.font-size;
        hinting = "full";
      };
    };
  };
}
