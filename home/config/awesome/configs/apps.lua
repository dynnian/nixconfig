-- Apps selection, see config/keys.lua to see how this is handled in keybindings
local apps = {
    terminal     = "kitty",

    -- rofi
    drunner      = "rofi -show drun -show-icons",   -- desktop runner
    runner       = "rofi -show run",                -- normal runner
    brunner      = "rofi -show filebrowser",        -- rofi file browser
    runner_power = "rofi_power",                    -- power manager
    runner_mount = "rofi_mount",                    -- drive mounter
    runner_blue  = "rofi_blue",                     -- bluetooth manager
    runner_wifi  = "rofi_wifi",                     -- wifi manager
    runner_scrot = "rofi_scrot",                    -- screenshots manager
    runner_emoji = "rofi_emoji",                    -- emojis manager
    runner_wall  = "rofi_wall",                     -- wallpapers manager
    runner_clip  = "rofi -modi 'clipboard:greenclip print' -show clipboard -run-command '{cmd}' -p '󱉧  Clipboard'",

    -- tui programs
    youtube_tui  = "kitty --title youtube-tui --class youtube-tui youtube-tui",
    ani_cli      = "kitty --title ani-cli --class ani-cli ani-cli",
    newsboat     = "kitty --title newsboat --class newsboat newsboat",
    btop         = "kitty --title btop --class btop btop",
    pulsemixer   = "kitty --title pulsemixer --class pulsemixer pulsemixer",

    -- default apps per tag
    editor       = "emacsclient -c -a 'emacs'",                            -- TAG 1
    file         = "kitty --title yazi --class yazi yazi",                 -- TAG 2
    browser      = "firefox",                                              -- TAG 3
    chat1        = "signal-desktop",                                       -- TAG 4
    chat2        = "ferdium",                                              -- TAG 4
    music1       = "kitty --title cmus --class cmus cmus",                 -- TAG 5
    music2       = "kitty --title termsonic --class termsonic termsonic",  -- TAG 5
    video_editor = "kdenlive",                                             -- TAG 6
    image_editor = "gimp",                                                 -- TAG 7
    office       = "onlyoffice-desktopeditors",                            -- TAG 8
    notes        = "obsidian",                                             -- TAG 8
    game         = "steam"                                                 -- TAG 9
}
return apps
