{ pkgs, ... }: {
  home.packages = with pkgs; [
    pyprland
  ];

  home.file.".config/pyprland/pyprland.toml".source = ''
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

    [scratchpads.file]
    command = "kitty -T yazi --app-id yazi yazi"
    class = "yazi"
    size = "65% 65%"
    animation = "fromTop"
    multi = false

    [scratchpads.rss]
    command = "kitty -T newsboat --app-id newsboat newsboat"
    class = "newsboat"
    size = "65% 65%"
    animation = "fromTop"
    multi = false

    [scratchpads.anime]
    command = "kitty -T ani-cli --app-id ani-cli ani-cli"
    class = "ani-cli"
    size = "65% 65%"
    animation = "fromTop"
    multi = false

    #[scratchpads.movies]
    #command = "kitty -T flix-cli --app-id flix-cli flix-cli"
    #class = "flix-cli"
    #size = "65% 65%"
    #animation = "fromTop"
    #multi = false

    [scratchpads.youtube]
    command = "kitty -T yt-x --app-id yt-x yt-x"
    class = "yt-x"
    size = "65% 65%"
    animation = "fromTop"
    multi = false

    [scratchpads.audiomixer]
    command = "kitty -T pulsemixer --app-id pulsemixer pulsemixer"
    class = "pulsemixer"
    size = "65% 65%"
    animation = "fromTop"
    multi = false

    [scratchpads.monitor]
    command = "kitty -T btop --app-id btop btop"
    class = "btop"
    size = "65% 65%"
    animation = "fromTop"
    multi = false
  '';
}