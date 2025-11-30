{ config, pkgs, ... }:
let
  profile = import ./../../user/profile.nix {};
in {
  programs.git = {
    enable = true;
    settings = {
      user = {
        name  = "${profile.fullname}";
        email = "${profile.email}";
      };
      init.defaultBranch = "main";
      pull.rebase = false;
    };
  };
}
