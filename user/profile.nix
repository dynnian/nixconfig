{ ... }: let
  user = "drk";                       # username
  fullname = "Lian Dynn";             # your fullname
  email = "lian_dynn@pm.me";          # email
  timezone = "America/Santo_Domingo"; # time zone
  defaultlocale = "en_US.UTF-8";
  extralocale = "en_US.UTF-8";
  nixos-version = "25.11";            # nixos version
  layout = "us";                      # layout language
  extralayout = "es";                 # extra layout language
in {
  inherit user;
  inherit email;
  inherit fullname;
  inherit timezone;
  inherit defaultlocale;
  inherit extralocale;
  inherit nixos-version;
  inherit layout;
  inherit extralayout;
}
