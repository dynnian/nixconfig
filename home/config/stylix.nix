{ config, pkgs, ... }:
let
  theme = import ./../../user/theme.nix {};
  monoFonts = pkgs.nerdfonts.override { fonts = [ "Mononoki" "SourceCodePro" ]; };
  base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
in {
  stylix = {
    enable = true;
    base16Scheme = base16Scheme;
    polarity = "dark";

    fonts = {
      serif = {
        package = pkgs.liberation_ttf;
        name = theme.font-serif;
      };
      sansSerif = {
        package = pkgs.inter;
        name = theme.font;
      };
      monospace = {
        package = monoFonts;
        name = theme.font-mono;
      };
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = theme.font-emoji;
      };
      sizes = {
        applications = theme.font-size;
        terminal = theme.font-size;
        popups = theme.font-size;
      };
    };

    cursor = {
      package = pkgs.simp1e-cursors;
      name = theme.cursor;
      size = theme.cursor-size;
    };

    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = theme.icon;
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
    };
  };
}
