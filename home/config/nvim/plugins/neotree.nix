{ ... }: {
  programs.nixvim.plugins = {
    neo-tree = {
      enable = true;
      settings = {
        close_if_last_window = true;
        window = { width = 30; };
        filesystem = {
          filtered_items = {
            hide_dotfiles = false;
            hide_gitignored = false;
          };
        };
      };
    };
  };
}
