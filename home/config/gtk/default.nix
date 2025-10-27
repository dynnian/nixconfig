{ config, pkgs, ... }:
let
  theme = import ./../../user/theme.nix {};

  # Derivation for the Catppuccin GTK theme from Fausto-Korpsvart's fork
  catppuccin-gtk-theme = pkgs.stdenv.mkDerivation rec {
    pname = "catppuccin-gtk-theme-fausto";
    # Using a date-based version since there are no official releases
    version = "unstable-2023-10-18";

    src = pkgs.fetchFromGitHub {
      owner = "Fausto-Korpsvart";
      repo = "Catppuccin-GTK-Theme";
      # Fetching the latest commit from the main branch for reproducibility
      rev = "f25d8cf688d8f224f0ce396689ffcf5767eb647e";
      # The build will fail with a hash mismatch error.
      # Replace this with the correct hash provided in the error message.
      sha256 = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    nativeBuildInputs = [
      pkgs.python3
      pkgs.sassc
      pkgs.inkscape
    ];

    installPhase = ''
      runHook preInstall
      # The install script builds and installs all theme variants
      ./install.sh -d $out/share/themes
      runHook postInstall
    '';
  };

  # Derivation for the Catppuccin icon theme
  catppuccin-icon-theme = pkgs.stdenv.mkDerivation {
    pname = "catppuccin-icon-theme-fausto";
    version = catppuccin-gtk-theme.version;
    src = catppuccin-gtk-theme.src;

    installPhase = ''
      runHook preInstall
      # Copy the icon theme folders into the output directory
      mkdir -p $out/share/icons
      cp -r $src/src/icons/* $out/share/icons/
      runHook postInstall
    '';
  };

in {
  home.packages = [ pkgs.dconf ];
  gtk.enable = true;

  gtk.cursorTheme.package = pkgs.simp1e-cursors;
  gtk.cursorTheme.name =  "${theme.cursor}";
  gtk.cursorTheme.size = 16;

  home.pointerCursor.package = pkgs.simp1e-cursors;
  home.pointerCursor.name = "${theme.cursor}";
  home.pointerCursor.size = 16;
  home.pointerCursor.x11.defaultCursor = "${theme.cursor}";

  xsession.enable = true;

  home.pointerCursor.x11.enable = true;

  gtk.iconTheme.package = catppuccin-icon-theme;
  gtk.iconTheme.name = "${theme.icon}";

  gtk.theme.package = catppuccin-gtk-theme;
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
}
