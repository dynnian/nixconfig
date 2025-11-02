{ config, pkgs, ... }:
let
  profile = import ./../../user/profile.nix {};
in {
  programs.git = {
    enable = true;
    userName  = "${profile.fullname}";
    userEmail = "${profile.email}";
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = false;
    };
  };
}
