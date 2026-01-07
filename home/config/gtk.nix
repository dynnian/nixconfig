{ pkgs, ... }:
let
  theme = import ./../../user/theme.nix {};
in {
  dconf.enable = true;
  gtk.enable = true;

  gtk.cursorTheme.package = pkgs.simp1e-cursors;
  gtk.cursorTheme.name =  "${theme.cursor}";
  gtk.cursorTheme.size = 16;

  home.pointerCursor.package = pkgs.simp1e-cursors;
  home.pointerCursor.name = "${theme.cursor}";
  home.pointerCursor.size = 16;

  gtk.iconTheme.package = pkgs.gruvbox-plus-icons;
  gtk.iconTheme.name = "${theme.icon}";

  gtk.theme.package = pkgs.gruvbox-gtk-theme;
  gtk.theme.name = "${theme.theme}";

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
  home.sessionVariables = {
    XCURSOR_PATH = "${pkgs.simp1e-cursors}/share/icons/";
    XCURSOR_THEME = "${theme.cursor}";
    GTK_THEME = "${theme.theme}";
    GTK_ICON_THEME = "${theme.icon}";
    GTK_CURSOR_THEME = "${theme.cursor}";
  };
}
