{ config, pkgs, lib, ... }:

let
  lazyssh = pkgs.buildGoModule {
    pname = "lazyssh";
    version = "0.3.0";

    src = pkgs.fetchFromGitHub {
      owner = "Adembc";
      repo  = "lazyssh";
      rev   = "v0.3.0";
      hash  = lib.fakeHash;
    };

    # Start with lib.fakeHash; after the first build Nix prints the real one.
    vendorHash = lib.fakeHash;

    subPackages = [ "cmd/lazyssh" ];
    ldflags = [ "-s" "-w" ];

    nativeBuildInputs = [ pkgs.makeWrapper ];
    postInstall = ''
      wrapProgram $out/bin/lazyssh --prefix PATH : ${pkgs.openssh}/bin
    '';

    meta = with lib; {
      description = "Terminal-based SSH manager (TUI) reading ~/.ssh/config";
      homepage    = "https://github.com/Adembc/lazyssh";
      license     = licenses.asl20;
      mainProgram = "lazyssh";
      platforms   = platforms.linux;
    };
  };
in
{
  home.packages = [ lazyssh ];
}
