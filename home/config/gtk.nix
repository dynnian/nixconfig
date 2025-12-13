{ pkgs, ... }:
let
  theme = import ./../../user/theme.nix {};
in {
  home.packages = [ pkgs.dconf ];
  gtk.enable = true;

  gtk.cursorTheme.package = pkgs.simp1e-cursors;
  gtk.cursorTheme.name =  "${theme.cursor}";
  gtk.cursorTheme.size = 16;

  home.pointerCursor.package = pkgs.simp1e-cursors;
  home.pointerCursor.name = "${theme.cursor}";
  home.pointerCursor.size = 16;

  gtk.iconTheme.package = pkgs.papirus-icon-theme;
  gtk.iconTheme.name = "${theme.icon}";

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
