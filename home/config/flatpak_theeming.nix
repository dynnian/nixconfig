{ config, pkgs, lib, ... }:

let
  userHome = config.home.homeDirectory;
  gtkConfig = config.gtk;

  iconThemeName = gtkConfig.iconTheme.name;
  themeName = gtkConfig.theme.name;
  cursorThemeName = gtkConfig.cursorTheme.name;

  iconThemePath = "${userHome}/.local/share/icons/${iconThemeName}";
  themePath     = "${userHome}/.local/share/themes/${themeName}";
  cursorThemePath = "${userHome}/.local/share/icons/${cursorThemeName}";

in
{
  # Symlink themes and icons into the home directory
  home.file.".local/share/icons/${iconThemeName}" = {
    source = lib.file.mkOutOfStoreSymlink "${userHome}/share/icons/${iconThemeName}";
  };

  home.file.".local/share/themes/${themeName}" = {
    source = lib.file.mkOutOfStoreSymlink "${userHome}/share/themes/${themeName}";
  };

  # Flatpak GTK overrides
  home.activation.flatpak-theme-overrides = lib.hm.dag.entryAfter ["xdg_config_home"] ''
    mkdir -p ${userHome}/.local/share/flatpak/overrides
    override_file="${userHome}/.local/share/flatpak/overrides/global"

    # Create override file if missing
    touch $override_file

    # Add GTK theme override for Flatpak
    ${pkgs.gawk}/bin/gawk -i inplace \
      -v gtk_theme="${themeName}" \
      '{
        if ($0 ~ /^# GTK_THEME=/) {
          $0 = "GTK_THEME=" gtk_theme
        }
        print
      }' $override_file

    # Add icon and cursor paths
    ${pkgs.gawk}/bin/gawk -i inplace \
      -v icons="${iconThemePath}" \
      -v theme="${themePath}" \
      -v cursor="${cursorThemePath}" \
      '{
        if ($0 ~ /^filesystems=/) {
          $0 = "filesystems=" icons ";" theme ";" cursor ";"
        }
        print
      }' $override_file

    # Apply user-level override for Flatpak
    ${pkgs.flatpak}/bin/flatpak override --user --env=GTK_THEME=${themeName}
  '';
}
