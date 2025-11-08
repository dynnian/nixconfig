{ pkgs, ... }: {
  home.packages = with pkgs; [
    # rs_emoji
    (writeShellScriptBin
      "rs_emoji"
      (builtins.readFile ./rs_emoji)
    )

    # rs_blue
    (writeShellScriptBin
      "rs_blue"
      (builtins.readFile ./rs_blue)
    )

    # rs_clip
    (writeShellScriptBin
      "rs_clip"
      (builtins.readFile ./rs_clip)
    )

    # rs_power
    (writeShellScriptBin
      "rs_power"
      (builtins.readFile ./rs_power)
    )

    # rs_scrot
    (writeShellScriptBin
      "rs_scrot"
      (builtins.readFile ./rs_scrot)
    )

    # rs_wall
    (writeShellScriptBin
      "rs_wall"
      (builtins.readFile ./rs_wall)
    )

    # rs_wifi
    (writeShellScriptBin
      "rs_wifi"
      (builtins.readFile ./rs_wifi)
    )

    # rs_mount
    (writeShellScriptBin
      "rs_mount"
      (builtins.readFile ./rs_mount)
    )

    # switchlayout
    (writeShellScriptBin
      "switchlayout"
      (builtins.readFile ./switchlayout)
    )
  ];
}
