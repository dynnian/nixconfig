{ inputs, ... }: {
  imports = [
    ./plugins
    ./autocmd.nix
    ./colorscheme.nix
    ./keymaps.nix
    ./lua.nix
    ./options.nix
    ./vim.nix
  ];

  programs.nixvim = {
    enable = true;
    nixpkgs.source = inputs.nixpkgs;
  };
}
