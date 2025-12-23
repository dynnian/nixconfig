{ ... }: {
  programs.nixvim.plugins = {
    persisted = {
      enable = true;
      settings = {
        autosave = true;
        autoload = true;
        use_git_branch = true;
      };
    };
  };
}
