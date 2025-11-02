{ config, pkgs, ... }:
let
  profile = import ../../user/profile.nix {};
  home-path = ''${config.home-manager.users.${profile.user}.home.path}'';
  home-files = ''${config.home-manager.users.${profile.user}.home-files}'';
  icon_theme_name = ''${config.home-manager.users.${profile.user}.gtk.iconTheme.name}'';
  theme_name = ''${config.home-manager.users.${profile.user}.gtk.theme.name}'';
  cursor_theme_name= ''${config.home-manager.users.${profile.user}.gtk.cursorTheme.name}'';
in
let
  gawk=''${pkgs.gawk}/bin/gawk'';
  flatpak=''${pkgs.flatpak}/bin/flatpak'';
  su=''${pkgs.su}/bin/su'';
  cursor_theme_path=''${home-files}/.local/share/icons/${cursor_theme_name}'';
  icon_theme_path=''${home-files}/.local/share/icons/${icon_theme_name}'';
  theme_path=''${home-files}/.local/share/themes/${theme_name}'';
  icon_theme_path_1=''${home-path}/share/icons/${icon_theme_name}'';
  theme_path_1=''${home-path}/share/themes/${theme_name}'';
in
let
  workaround =
    ''
    ${gawk} -i inplace '{gsub(/\/nix\/store[^;]*;|!\/nix\/store[^;]*;/,""); print}' /var/lib/flatpak/overrides/global
    ${gawk} -i inplace '{gsub(/filesystems=/,"filesystems=${icon_theme_path};${theme_path};${cursor_theme_path};"); print}' /var/lib/flatpak/overrides/global
    ${gawk} -i inplace '{gsub(/\/nix\/store[^;]*;|!\/nix\/store[^;]*;/,""); print}' /home/${profile.user}/.local/share/flatpak/overrides/global
    ${gawk} -i inplace '{gsub(/filesystems=/,"filesystems=${icon_theme_path};${theme_path};${cursor_theme_path};"); print}' /home/${profile.user}/.local/share/flatpak/overrides/global
    ${flatpak} override --env=GTK_THEME=${theme_name}
    ${su} ${profile.user} -c '${flatpak} override --user --env=GTK_THEME=${theme_name}'
    '';
in
{
  ##workaround for themes and icons
  systemd.services.workaround-for-theme-and-icons = {
      wantedBy = ["multi-user.target"];
      after = ["systemd-user-sessions.service"] ;
      before = ["getty.target"] ;
      script = workaround;
  };
  home-manager.users.${profile.user}.home.file = {
    ".local/share/icons/${icon_theme_name}".source = config.home-manager.users.${profile.user}.lib.file.mkOutOfStoreSymlink "${icon_theme_path_1}";
    ".local/share/themes/${theme_name}".source = config.home-manager.users.${profile.user}.lib.file.mkOutOfStoreSymlink "${theme_path_1}";
  };
}
