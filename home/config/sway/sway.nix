{ pkgs, hostname, lib, ... }: 
let
  isWorkPad = hostname == "workpad";
in  {
  home.packages = with pkgs; [
    swaybg
    sway-audio-idle-inhibit
    wl-clipboard
    cliphist
    youtube-tui
    wf-recorder
    grim
    slurp
  ];

  wayland.windowManager.sway = {
    enable = true;
    package = pkgs.sway;
    xwayland = true;

    extraOptions = lib.optionals isWorkPad [
      "--unsupported-gpu"
      "-Dnoscanout"
    ];
  };
}
