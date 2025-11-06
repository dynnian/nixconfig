{ config, pkgs, lib, ... }:

let
  lazyssh = pkgs.buildGoModule {
    pname = "lazyssh";
    version = "0.3.0";

    src = pkgs.fetchFromGitHub {
      owner = "Adembc";
      repo  = "lazyssh";
      rev   = "v0.3.0";
      hash  = "sha256-6halWoLu9Vp6XU57wAQXaWBwKzqpnyoxJORzCbyeU5Q=";
    };

    vendorHash = "sha256-OMlpqe7FJDqgppxt4t8lJ1KnXICOh6MXVXoKkYJ74Ks=";

    # Use upstream build script — it knows the right main package path.
    nativeBuildInputs = [ pkgs.gnumake pkgs.makeWrapper ];
    buildPhase = ''
      make build
    '';

    installPhase = ''
      install -Dm755 bin/lazyssh -t $out/bin
      # Ensure OpenSSH is on PATH when launched
      wrapProgram $out/bin/lazyssh --prefix PATH : ${pkgs.openssh}/bin
    '';

    ldflags = [ "-s" "-w" ];

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
