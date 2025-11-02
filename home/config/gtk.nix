{ config, pkgs, ... }:
let
  theme = import ./../../user/theme.nix {};

  # Derivation for the Catppuccin GTK theme from Fausto-Korpsvart's fork
  catppuccin-gtk-theme = pkgs.stdenv.mkDerivation rec {
    pname = "catppuccin-gtk-theme";
    version = "custom-0.1";

    src = pkgs.fetchFromGitHub {
      owner = "Fausto-Korpsvart";
      repo = "Catppuccin-GTK-Theme";
      rev = "f25d8cf688d8f224f0ce396689ffcf5767eb647e";
      sha256 = "sha256-W+NGyPnOEKoicJPwnftq26iP7jya1ZKq38lMjx/k9ss=";
    };

    # The source root is the "source" directory created by fetchFromGitHub
    sourceRoot = "source";

    nativeBuildInputs = [
      pkgs.python3
      pkgs.sassc
      # pkgs.inkscape # Inkscape might not be needed for the Nix build, only if building source SVGs
      pkgs.jdupes # Used in the official install script for deduplication
    ];

    propagatedUserEnvPkgs = [ pkgs.gtk-engine-murrine ];

    dontBuild = true; # No standard build process

    # Ensure the scripts are executable and use the right interpreter
    postPatch = ''
      find -name "*.sh" -print0 | while IFS= read -r -d ''' file; do
        patchShebangs "$file"
      done
    '';

    installPhase = ''
      runHook preInstall

      mkdir -p $out/share/themes

      # Now we call the script from the correct path relative to sourceRoot (./source/)
      ./themes/install.sh \
        --name ${pname} \
        --dest $out/share/themes

      # Optional: jdupes for space saving, as in the official script
      jdupes --quiet --link-soft --recurse $out/share

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

  gtk.iconTheme.package = pkgs.papirus-icon-theme;
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

  # link themes to home directory
  home.file.".local/share/themes" = {
    source = "${catppuccin-gtk-theme}/share/themes";
    recursive = true;
    force = true;
    copy = true;
  };
}
