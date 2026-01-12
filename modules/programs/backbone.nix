{ pkgs, ... }: {
  # install common packages
  environment.systemPackages = with pkgs; [
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
    pulsemixer
    udisks
    yt-dlp
    xdg-user-dirs
    fastfetch
    libnotify
    unzip
    zip
    unrar
    p7zip
    ffmpeg
    acpi
    lm_sensors
    tree
    lsof
    dnsutils
  ];
}
