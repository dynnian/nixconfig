{ pkgs, ... }: with pkgs;
let
  theme = import ./../../user/theme.nix {};
  profile = import ./../../user/profile.nix {};
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
      nerd-fonts._3270
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
        monospace = ["${theme.font-mono}" "${theme.font-mono-alt}"];
        serif = ["${theme.font-serif}" "${theme.font-serif-alt}"];
        sansSerif = ["${theme.font}" "${theme.font-alt}"];
        emoji = ["${theme.font-emoji}"];
      };
    };
  };
}
