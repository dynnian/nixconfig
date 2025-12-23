{ ... }: {
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      servers = {
        bashls.enable = true;
        nixd.enable   = true;
        lua_ls.enable = true;
        csharp_ls.enable = true;
        gopls.enable = true;
        rust_analyzer = { 
          enable = true; 
          installCargo = false;
          installRustc = false;
        };
      };
    };
  };
}
