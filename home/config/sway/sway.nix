{ pkgs, hostname, lib, ... }: 
let
  isWorkPad = hostname == "workpad";
in  {
  home.packages = with pkgs; [
    swaybg
    swayidle
    sway-audio-idle-inhibit
    wl-clipboard
    cliphist
    youtube-tui
    ani-cli
    wf-recorder
    grim
    slurp
    dex
  ];

  wayland.windowManager.sway = {
    enable = true;
    package = pkgs.sway;
    xwayland = true;
    checkConfig = false;
    config.defaultWorkspace = "workspace number 1";

    extraOptions = lib.optionals isWorkPad [
      "--unsupported-gpu"
      "-Dnoscanout"
    ];
  };
}
