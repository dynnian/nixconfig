{ config, pkgs, ... }: {
  home.packages = [ pkgs.dconf ];
  gtk.enable = true;

  gtk.cursorTheme.package = pkgs.simp1e-cursors;
  gtk.cursorTheme.name =  "Simp1e-Gruvbox-Dark";
  gtk.cursorTheme.size = 16;

  home.pointerCursor.package = pkgs.simp1e-cursors;
  home.pointerCursor.name = "Simp1e-Gruvbox-Dark";
  home.pointerCursor.size = 16;
  home.pointerCursor.x11.defaultCursor = "Simp1e-Gruvbox-Dark";

  xsession.enable = true;

  home.pointerCursor.x11.enable = true;

  gtk.iconTheme.package = pkgs.gruvbox-dark-icons-gtk;
  gtk.iconTheme.name = "gruvbox-dark-icons-gtk";

  gtk.theme.package = pkgs.gruvbox-gtk-theme;
  gtk.theme.name = "Gruvbox-BL-LB-Dark";

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
