{ ... }: {
  programs.nixvim.plugins = {
    cmp = {
      enable = true;
      autoEnableSources = false;
    };

    # Completion SOURCES (these are separate plugins)
    "cmp-nvim-lsp".enable = true;
    "cmp-buffer".enable   = true;
    "cmp-path".enable     = true;
    "cmp_luasnip".enable  = true;
  };
}
