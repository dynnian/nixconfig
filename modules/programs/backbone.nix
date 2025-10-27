{ ... }: {
  # install common packages
  environment.systemPackages = with pkgs; [
    vim
    git
    wget
    curl
    bat
    eza
    fzf
    jq
    ripgrep
    fd
    htop
    btop
    pulsemixer
    pamixer
    udisks
    xdg-user-dirs
    fastfetch
  ];
}