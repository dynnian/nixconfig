{ ... }: {
  programs.nixvim.plugins.which-key = {
    enable = true;
    settings = {
      delay = 300;
      win = {
        border = "rounded";
      };
      plugins = {
        marks = true;
        registers = true;
        spelling = { enabled = true; suggestions = 20; };
        presets = {
          operators = true;
          motions = true;
          text_objects = true;
          windows = true;
          nav = true;
          z = true;
          g = true;
        };
      };
    };
  };
}
