{ ... }: {
  programs.nixvim.plugins = {
    gitsigns.enable = true;
    neogit.enable = true;
  };
}
