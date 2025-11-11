{ pkgs, ... }: {
  home.packages = with pkgs; [
    pyprland
    unstable.youtube-tui
    termsonic
  ];

  home.file.".config/hypr/pyprland.toml".source = pkgs.writeText "pyprland.toml" ''
    [pyprland]
    plugins = [
        "scratchpads"
    ]

    [scratchpads.music]
    command = "kitty -T cmus --app-id cmus cmus"
    class = "cmus"
    size = "65% 65%"
    animation = "fromTop"
    multi = false
    lazy = true
    unfocus = "hide"

    [scratchpads.termsonic]
    command = "kitty -T termsonic --app-id termsonic termsonic"
    class = "termsonic"
    size = "65% 65%"
    animation = "fromTop"
    multi = false
    lazy = true
    unfocus = "hide"

    [scratchpads.file]
    command = "kitty -T yazi --app-id yazi yazi"
    class = "yazi"
    size = "65% 65%"
    animation = "fromTop"
    multi = false
    lazy = true
    unfocus = "hide"

    [scratchpads.rss]
    command = "kitty -T newsboat --app-id newsboat newsboat"
    class = "newsboat"
    size = "65% 65%"
    animation = "fromTop"
    multi = false
    lazy = true
    unfocus = "hide"

    [scratchpads.youtube]
    command = "kitty -T youtube-tui --app-id youtube-tui youtube-tui"
    class = "youtube-tui"
    size = "65% 65%"
    animation = "fromTop"
    multi = false
    lazy = true
    unfocus = "hide"

    [scratchpads.audiomixer]
    command = "kitty -T pulsemixer --app-id pulsemixer pulsemixer"
    class = "pulsemixer"
    size = "65% 65%"
    animation = "fromTop"
    multi = false
    lazy = true
    unfocus = "hide"

    [scratchpads.monitor]
    command = "kitty -T btop --app-id btop btop"
    class = "btop"
    size = "65% 65%"
    animation = "fromTop"
    multi = false
    lazy = true
    unfocus = "hide"
  '';
}
