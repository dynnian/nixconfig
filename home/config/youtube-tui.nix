{ pkgs, ... }: {
  home.packages = with pkgs; [
    unstable.youtube-tui
  ];
}