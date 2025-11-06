# modules/lazyssh.nix
{ config, pkgs, lib, ... }:

let
  pname   = "lazyssh";
  version = "0.3.0";  # or pin a commit; see note below

  lazyssh = pkgs.buildGoModule {
    inherit pname version;

    src = pkgs.fetchFromGitHub {
      owner = "Adembc";
      repo  = "lazyssh";
      rev   = "v${version}";
      hash  = "sha256-6halWoLu9Vp6XU57wAQXaWBwKzqpnyoxJORzCbyeU5Q=";
    };

    vendorHash = "sha256-OMlpqe7FJDqgppxt4t8lJ1KnXICOh6MXVXoKkYJ74Ks=";

    # Upstream builds ./cmd (see Makefile: CMD_DIR ?= ./cmd)
    subPackages = [ "cmd" ];

    # Optional: mimic upstream ldflags (main.version/main.gitCommit are set in main.go)
    # We can set version; commit is unknown because fetchFromGitHub doesn't provide git metadata.
    ldflags = [
      "-s" "-w"
      "-X" "main.version=v${version}"
    ];

    # Ensure `ssh` is on PATH when the app runs
    nativeBuildInputs = [ pkgs.makeWrapper ];
    postInstall = ''
      wrapProgram "$out/bin/${pname}" --prefix PATH : ${pkgs.openssh}/bin
    '';

    meta = with lib; {
      description = "Terminal-based SSH manager (TUI) reading ~/.ssh/config";
      homepage    = "https://github.com/Adembc/lazyssh";
      license     = licenses.asl20;
      mainProgram = pname;
      platforms   = platforms.linux;
    };
  };
in {
  home.packages = [ lazyssh ];
}
