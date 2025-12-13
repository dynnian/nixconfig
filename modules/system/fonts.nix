{ config, pkgs, ... }: with pkgs;
let
  profile = import ./../../user/profile.nix {};
  stylixFonts = config.stylix.fonts;
  defaultMono = stylixFonts.monospace.name;
  defaultSans = stylixFonts.sansSerif.name;
  defaultSerif = stylixFonts.serif.name;
  defaultEmoji = stylixFonts.emoji.name;
in {
  # set console font and keymap
  console = {
    font = "ter-118n";
    keyMap = "${profile.layout}";
    earlySetup = true;
    packages = with pkgs; [ terminus_font ];
  };
  systemd.services.systemd-vconsole-setup.unitConfig.After = "local-fs.target";

  # fonts configuration
  fonts = {
    enableDefaultPackages = true;
    packages = [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
      cantarell-fonts
      carlito
      inter
      lato
      liberation-sans-narrow
      liberation_ttf
      montserrat
      nerd-fonts.mononoki
      nerd-fonts.symbols-only
      roboto
      roboto-mono
      roboto-serif
      roboto-slab
      source-code-pro
      source-sans
      source-sans-pro
      source-serif
      source-serif-pro
      corefonts
      vista-fonts
    ];
    fontconfig = {
      defaultFonts = {
        monospace = [ defaultMono "Source Code Pro" ];
        serif = [ defaultSerif "Source Serif Pro" ];
        sansSerif = [ defaultSans "Cantarell" ];
        emoji = [ defaultEmoji ];
      };
    };
  };
}
