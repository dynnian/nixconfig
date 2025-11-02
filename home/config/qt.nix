{ pkgs, ... }:
let
  variant = "mocha";
  accent = "lavender";
  kvantumThemePackage = pkgs.catppuccin-kvantum.override {
    inherit variant accent;
  };
in {
  home.packages = with pkgs; [
    (catppuccin-kvantum.override {
      variant = "${variant}";
      accent = "${accent}";
    })
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
    kdePackages.qtstyleplugin-kvantum
    kdePackages.qt6ct
  ];

  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style = {
      name = "kvantum";
      package = pkgs.catppuccin-kvantum.override {
        variant = "${variant}";
        accent = "${accent}";
      };
    };
  };

  xdg.configFile = {
    "Kvantum/kvantum.kvconfig".text = ''
      [General]
      theme=catppuccin-${variant}-${accent}
    '';

    # The important bit is here, links the theme directory from the package to a directory under `~/.config`
    # where Kvantum should find it.
    "Kvantum/catppuccin-${variant}-${accent}".source = "${kvantumThemePackage}/share/Kvantum/catppuccin-${variant}-${accent}";
  };
}