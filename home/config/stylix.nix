{ pkgs, ... }:
let
  monoFont = pkgs.nerd-fonts.mononoki;
  base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
in {
  stylix = {
    enable = true;
    base16Scheme = base16Scheme;
    polarity = "dark";

    fonts = {
      serif = {
        package = pkgs.liberation_ttf;
        name = "Liberation Serif";
      };
      sansSerif = {
        package = pkgs.inter;
        name = "Inter";
      };
      monospace = {
        package = monoFont;
        name = "Mononoki Nerd Font";
      };
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
      sizes = {
        applications = 12;
        terminal = 12;
        popups = 12;
      };
    };

    cursor = {
      package = pkgs.simp1e-cursors;
      name = "Simp1e-Catppuccin-Mocha";
      size = 16;
    };

    iconTheme = {
      package = pkgs.papirus-icon-theme;
      dark = "Papirus-Dark";
      light = "Papirus";
    };

    opacity = {
      applications = 1.0;
      terminal = 0.9;
      desktop = 1.0;
      popups = 0.9;
    };

    targets = {
      gtk.enable = true;
      qt.enable = true;
      hyprland.enable = true;
      waybar.enable = true;
      fuzzel.enable = true;
      swaync.enable = true;
      kitty.enable = true;
      btop.enable = true;
      zathura.enable = true;
    };
  };
}
