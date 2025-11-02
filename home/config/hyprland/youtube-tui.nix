{ unstablePkgs, ... }: {
  home.packages = with unstablePkgs; [
    youtube-tui
  ];
}