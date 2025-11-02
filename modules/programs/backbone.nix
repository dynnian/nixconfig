{ pkgs, ... }: {
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
    starship
    pulsemixer
    pamixer
    playerctl
    udisks
    brightnessctl
    xdg-user-dirs
    fastfetch
    libnotify
    unzip
    zip
    unrar
    p7zip
  ];
}
