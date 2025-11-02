{ ... }:
let
  # This file defines the default applications to be installed by home-manager
  #editor = "neovim";
  visual = "neovide";
  browser = "firefox";
  viewer = "imv";
  videoplayer = "mpv";
  musicplayer = "cmus";
  pdfviewer = "zathura";
#  videoeditor = "kdePackages.kdenlive";
  audioeditor = "tenacity";
  audiotools = [
    "qpwgraph"
    "freac"
    "kid3"
    "flacon"
  ];
  imageeditors = [
    "gimp"
    "inkscape"
    "krita"
  ];
  messaging = [
    "signal-desktop"
    "ferdium"
    "discord"
  ];
  office = "onlyoffice-desktopeditors";
  notes = "obsidian";
  nextcloud = "nextcloud-client";
in {
#  inherit editor;
  inherit visual;
  inherit browser;
  inherit viewer;
  inherit videoplayer;
  inherit musicplayer;
  inherit pdfviewer;
#  inherit videoeditor;
  inherit audioeditor;
  inherit audiotools;
  inherit imageeditors;
  inherit messaging;
  inherit office;
  inherit notes;
  inherit nextcloud;
}
