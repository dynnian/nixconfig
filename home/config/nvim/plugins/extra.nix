{ pkgs, ... }: {
  programs.nixvim = {
    plugins = {
      web-devicons.enable = true;
    };
    # Extra plugins (not covered by nixvim modules)
    extraPlugins = with pkgs.vimPlugins; [
      vim-nix
      vim-javascript
      toggleterm-nvim
    ];
  };
}
