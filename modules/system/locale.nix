{ ... }: let

  profile = import ./../../user/profile.nix {};

in {
  i18n = {
    defaultLocale = "${profile.defaultlocale}";
    extraLocaleSettings = {
      LANGUAGE = "${profile.defaultlocale}";
      LC_ADDRESS = "${profile.extralocale}";
      LC_COLLATE = "${profile.extralocale}";
      LC_CTYPE = "${profile.extralocale}";
      LC_IDENTIFICATION = "${profile.extralocale}";
      LC_MEASUREMENT = "${profile.extralocale}";
      LC_MESSAGES = "${profile.extralocale}";
      LC_MONETARY = "${profile.extralocale}";
      LC_NAME = "${profile.extralocale}";
      LC_NUMERIC = "${profile.extralocale}";
      LC_PAPER = "${profile.extralocale}";
      LC_TELEPHONE = "${profile.extralocale}";
      LC_TIME = "${profile.extralocale}";
    };
  };
}