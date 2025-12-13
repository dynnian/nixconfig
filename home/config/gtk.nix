{ config, pkgs, ... }:
let
  cursor = config.stylix.cursor;
  icons = config.stylix.iconTheme;
in {
  home.packages = [ pkgs.dconf ];
  gtk.enable = true;

  gtk.cursorTheme = cursor;

  home.pointerCursor = cursor;

  gtk.iconTheme = icons;

  gtk.gtk3.extraConfig = {
        gtk-application-prefer-dark-theme=1;
        gtk-dialogs-use-header=false;
        gtk-cursor-theme-size=0;
        gtk-toolbar-style="GTK_TOOLBAR_BOTH";
        gtk-toolbar-icon-size="GTK_ICON_SIZE_LARGE_TOOLBAR";
        gtk-button-images=1;
        gtk-menu-images=1;
        gtk-enable-event-sounds=1;
        gtk-enable-input-feedback-sounds=1;
        gtk-xft-antialias=1;
        gtk-xft-hinting=1;
        gtk-xft-hintstyle="hintfull";
        gtk-xft-rgba="none";
  };
}
