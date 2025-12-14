{ pkgs, ... }: {
  home.packages = with pkgs; [
    maim
    slop
    xwallpaper
    xss-lock
    xidlehook
    unclutter-xfixes
    xclip
    xorg.xdpyinfo
    xdotool
    haskellPackages.greenclip

    # rofi_emoji
    (writeShellScriptBin
      "rofi_emoji"
      (builtins.readFile ./rofi_emoji)
    )

    # rofi_blue
    (writeShellScriptBin
      "rofi_blue"
      (builtins.readFile ./rofi_blue)
    )

    # rofi_power
    (writeShellScriptBin
      "rofi_power"
      (builtins.readFile ./rofi_power)
    )

    # rofi_scrot
    (writeShellScriptBin
      "rofi_scrot"
      (builtins.readFile ./rofi_scrot)
    )

    # rofi_wall
    (writeShellScriptBin
      "rofi_wall"
      (builtins.readFile ./rofi_wall)
    )

    # rofi_wifi
    (writeShellScriptBin
      "rofi_wifi"
      (builtins.readFile ./rofi_wifi)
    )

    # rofi_mount
    (writeShellScriptBin
      "rofi_mount"
      (builtins.readFile ./rofi_mount)
    )

    # wm_monitors
    (writeShellScriptBin
      "wm_monitors"
      (builtins.readFile ./wm_monitors)
    )

    # wm_autostart
    (writeShellScriptBin
      "wm_autostart"
      (builtins.readFile ./wm_autostart)
    )
  ];
}
