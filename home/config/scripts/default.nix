{ pkgs, ... }: 
let
  emojiData = pkgs.writeTextFile {
    name = "emoji-data";
    text = builtins.readFile ./emojis.txt;
  };

  rs_emoji = pkgs.writeShellScriptBin "rs_emoji" ''
    #!/usr/bin/env bash
    EMOJI_DATA_FILE="${emojiData}/emoji.txt"
    cat "$EMOJI_DATA_FILE" | fuzzel --dmenu -i -p "[󰙃 Select Emoji]  " | cut -d ' ' -f 1 | tr -d '\n' | wl-copy
  '';
in {
  home.packages = with pkgs; [
    # mediacontrol
    (writeShellScriptBin
      "mediacontrol"
      (builtins.readFile ./mediacontrol)
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

    # rs_emoji
    rs_emoji

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

    # switchlayout
    (writeShellScriptBin
      "switchlayout"
      (builtins.readFile ./switchlayout)
    )
  ];
}
